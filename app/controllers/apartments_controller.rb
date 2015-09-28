class ApartmentsController < ApplicationController
  before_action :require_admin
  before_action :set_apartment, only: [:edit, :update]
  
  # GET '/'
  def index
    @apartments = Apartment.all
    render 'apartments/index' #happens by default and end of each method
  end


  # GET '/apartments/id/edit'
  def edit #url will be something like /apartment/3/edit, edit form will be rendered
    #@apartment = Apartment.find(params[:id]) #set_apartment does this
    #edit.html... rendered by default
  end

  # PATCH '/apartments/id'
  #the general pattern used in the action create that handles
  #submission of model-backed forms 
  def update # this is where the form displayed in 'edit' is submitted using verb "patch"
    if @apartment.update(apartment_params)
      flash[:notice] = "Apartment information updated"
      # send to show apartment_path (add _path to the prefix)
      redirect_to apartments_path(@apartment)
    else
      render :edit
    end
  end

  private

  def apartment_params
    #use strong parameters to expose the fields we're interested in
    #require top level key be apartment and allow changes to fields
    params.require(:apartment).permit(:apartment_number,
     :description, :rent, :date_available)
    #To permit all attributes 
    #params.require(:apartment).permit!
  end

  def set_apartment
    # ask ActiveRecord to find the Apartment object in the db using the id from params
    @apartment = Apartment.find(params[:id]) #looking at the model layer
    #@apartment = Apartment.find_by(slug: params[:id])
  end


end