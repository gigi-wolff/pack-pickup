class PackagesController < ApplicationController
  before_action :require_user
  before_action :set_package, only: [:edit, :update, :show, :destroy]
  before_action :set_resident
  before_action :package_params, only: [:create]
  before_action :require_admin, except: [:show]
  after_action :decrement_package_count, only: [:update]
  after_action :increment_package_count, only: [:create]


  #GET /residents/:resident_id/packages/:id
  def show 
    #show.html... rendered by default
  end

  # GET /residents/resident_id/packages/package_id/edit
  # @resident and @package are set already
  def edit 
  end

  # PATCH /residents/:resident_id/packages/:id
  #the general pattern used in the action create that handles
  #submission of model-backed forms 
   def update # this is where the form displayed in 'edit' is submitted using verb "patch"
    respond_to do |format|
      if @package.update(package_params)
        format.html do # html request
          flash[:notice] = "Package information updated"
          # send to show resident_path (add _path to the prefix)
          redirect_to resident_path(@resident)
        end
        format.js do #ajax request
          #render a update.js, which will have access to instance variables
          # from update method, by default
          format.js
        end
      else
        render 'residents/show' 
      end
    end
  end

  def new 
    if current_user.admin? then 
      @package = Package.new # package object 
    end
  end

  def create 
    @package = Package.new(package_params)
    @package.resident = @resident #associate package with the particular resident
    if @package.save
      flash[:notice] = "Package was added"
      redirect_to resident_path(@resident)
    else
      render 'residents/show' 
    end
  end

  # DELETE /packages/:id
  def destroy
    @package.destroy
    flash[:success] = "Packaged Deleted"
    redirect_to resident_path(@resident)
  end


  private

  def package_params
    #use strong parameters to expose the fields we're interested in
    #require top level key be package and allow changes to fields   
    params.require(:package).permit(:arrived, :picked_up)
    #To permit all attributes 
    #params.require(:package).permit!
  end

  def set_package
    # ask ActiveRecord to find the package object in the db using the id from params
    @package = Package.find(params[:id]) #looking at the model layer
  end

  def set_resident
    # ask ActiveRecord to find the package object in the db using the id from params
    #@resident = Resident.find(params[:resident_id])
    @resident = Resident.find_by(slug: params[:resident_id])
  end

  def increment_package_count
    if @package.arrived 
      @resident.package_count = @resident.package_count.to_i + 1
      @resident.save
    end
  end

  def decrement_package_count
    if @package.picked_up 
      @resident.package_count = @resident.package_count.to_i - 1
      @resident.save
    end
  end

end