class PackagesController < ApplicationController
  before_action :set_package, only: [:edit, :update, :show]
  before_action :package_params, only: [:create]

  #GET /residents/:resident_id/packages/:id
  def show 
    #show.html... rendered by default
  end

   # GET /residents/resident_id/packages/package_id/edit
  def edit 
    @resident = Resident.find(params[:resident_id])
    #@package = Package.find(params[:id])
    #edit.html... rendered by default
  end

  # PATCH /residents/:resident_id/packages/:id
  #the general pattern used in the action create that handles
  #submission of model-backed forms 
  def update # this is where the form displayed in 'edit' is submitted using verb "patch"
    if @package.update(package_params)
      flash[:notice] = "Package information updated"
      # send to show resident_path (add _path to the prefix)
      redirect_to resident_path(@resident)
    else
      render :edit
    end
  end

  # resident '/residents/:resident_id/packages'
  # coming in from /residents/show.html.erb
  def create 
    @resident = Resident.find_by(id: params[:resident_id])
    @package = Package.new(package_params)
    @package.resident = @resident #associate package with the particular resident
    @package.apartment_id = 
    Apartment.find_by(apartment_number: @resident.apartment_number).id
    #@package.apartment_id = @resident.apartment_id #associate package with the particular apartment
    if @package.save
      flash[:notice] = "Your package was added"
      redirect_to residents_path(@resident) #redirect must be a url
    else
      #package was submitted from 'residents/show', so this is where
      #you go back to display errors. This template needs 
      #@resident and @package to be set up in order to work.
      render 'residents/show' # render must be a template file
    end
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
    #@resident = resident.find_by(slug: params[:id])
  end

end