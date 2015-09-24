class Resident < ActiveRecord::Base
  belongs_to :apartment #can call a Resident method on any Apartment object
  #dependent: :destroy, rails will destroy all packages associated with resident
  has_many :packages, dependent: :destroy 

  #add gem 'bcrypt-ruby', '=3.0.1' to gemfile to use has_secure_password method
  #set validations to false to manage validations ourselves 
  has_secure_password validations: false

  validates :apartment_number, inclusion: {in: %w(1A 1B 1C 2A 2B 2C),
    message: "invalid"}

  validates_presence_of :first_name, :last_name

  validates :phone_personal,
    :numericality => {:only_integer => true, message: "numbers only: 1234567890"}, 
    length: {is: 10, message: "is the wrong length (should be 10 digits)"} 

  validates :phone_work, 
    :numericality => {:only_integer => true, message: "enter numbers only: 1234567890"}, 
    length: {is: 10, message: "is the wrong length (should be 10 digits)"}

  after_validation :set_apartment_id, on: :create

  def set_apartment_id
    self.apartment_id = Apartment.find_by(apartment_number: self.apartment_number).id
  end

  def admin?
    self.role == 'admin'
  end
end