class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update]
  
  # GET '/'
  def index    
    @residents = Resident.all
    render 'residents/index' #happens by default and end of each method
  end

  # GET '/residents/id'
  def show   # Here we display the form to be filled out
    #already have @resident at this point
    #you need a package object for the model backed form in 'residents/show'
    @package = Package.new # package object 
    #render 'residents/show' (show.html.erb) automatically called before exiting this method
    #the form in 'residents/show' will submit info to path:
    #residents/id/package which maps to packages#create
    #so a packages_controller is needed to create a package via "def create"    
  end

  # GET '/residents/new'
  def new
    #set up a new instance variable which is an active record object
    #and pass it to the 'new' template in "new.html.erb" 
    #which is called by default
    @resident = Resident.new 
  end

  # resident '/residents'
  #the general pattern used in the action create that handles
  #submission of model-backed forms -- where you go after new
  def create 
    # the form displayed in "new.html.erb" is submitted to '/residents' 
    # using verb method="resident" which is routed to residents#create.
    # @resident, is populated with values submitted from the form
    @resident = Resident.new(resident_params) 
    #check for valid apartment number 
    if valid_apartment?(resident_params[:apartment_number])  
     @resident.apartment_id = 
      Apartment.find_by(apartment_number: resident_params[:apartment_number]).id
    end
    if @resident.save #@resident.save returns "false" if can't save
      flash[:notice] = "Resident was added"
      #redirect must be a url
      redirect_to residents_path #goes to index action    
    else
    #validation error occured. We must render to have access to 
    #"resident.error.full_messages" array to display generated errors   
      render :new #display new.html.erb
    end
  end

  # GET '/residents/id/edit'
  def edit #url will be something like /resident/3/edit, edit form will be rendered
    #@resident = Resident.find(params[:id])  # ... this is now done by set_resident
    #edit.html... rendered by default
  end

  # PATCH '/residents/id'
  #the general pattern used in the action create that handles
  #submission of model-backed forms 
  def update # this is where the form displayed in 'edit' is submitted using verb "patch"
    if @resident.update(resident_params)
      flash[:notice] = "resident information updated"
      # send to show resident_path (add _path to the prefix)
      redirect_to residents_path(@resident)
    else
      render :edit
    end
  end

  private

  def resident_params
    #use strong parameters to expose the fields we're interested in
    #require top level key be resident and allow changes to fields
    params.require(:resident).permit(:apartment_number, :first_name,:last_name,:phone_personal,
      :phone_work)
    #To permit all attributes 
    #params.require(:resident).permit!
  end

  def set_resident
    # ask ActiveRecord to find the resident object in the db using the id from params
    @resident = Resident.find(params[:id]) #looking at the model layer
    #@resident = resident.find_by(slug: params[:id])
 end

  def valid_apartment?(apt)
    apartments=["1A", "1B", "1C", "2A", "2B", "2C"]
    apartments.include?(apt)
  end
end