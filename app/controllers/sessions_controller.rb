
class SessionsController < ApplicationController

  def new #display login form in new.html.erb
  end

  def create #after hitting submit in new form we go here
    # since sessions is non-model backed form, 
    # no errors are generated, must manually validate resident information
    # get resident obj
    resident = Resident.where(username: params[:username]).first #.where returns an array
    if resident && resident.authenticate(params[:password])
      #session is browser cookie
      #save resident_id not object due to size limit of session
      session[:resident_id] = resident.id  
      flash[:notice] = "Login Successful" 
      if (resident.admin?) then  
        redirect_to residents_path #goes to /residents/index
      else 
        redirect_to resident_path(resident) #goes to /residents/show
      end
    else   
      flash[:error] = "There's a problem with your username or password"
      redirect_to login_path 
    end 
  end

  def destroy 
    #remove resident_id from session cookie
    session[:resident_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end

  private

  def resident_params 
    params.require(:resident).permit(:residentname, :password)
  end

end