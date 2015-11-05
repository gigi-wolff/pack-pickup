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
    :with => /\A^[0-9]\z/, message:"should contain only digits please",
    length: {is: 10, message: "is the wrong length (should be 10 digits)"} 
    #:numericality => {:only_integer => true, message: "numbers only: 1234567890"}, 

  validates_format_of :phone_work, 
    :with => /\A^[0-9]\z/, message:"should contain only digits please", 
    length: {is: 10, message: "is the wrong length (should be 10 digits)"}

  validates :username, presence: true, uniqueness: true, on: :create 

  before_save :generate_slug

  def admin?
    self.role == 'admin'
  end

  def generate_slug
    self.slug = self.first_name + "-" + self.last_name + "-" +self.apartment_number
  end

  def to_param
    self.slug
  end
end