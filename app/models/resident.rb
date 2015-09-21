class Resident < ActiveRecord::Base
  belongs_to :apartment #can call a Resident method on any Apartment object
  #dependent: :destroy, rails will destroy all packages associated with resident
  has_many :packages, dependent: :destroy 

  validates :apartment_number, inclusion: {in: %w(1A 1B 1C 2A 2B 2C),
    message: "invalid"}
  validates_presence_of :first_name, :last_name

  validates :phone_personal,
    :numericality => {:only_integer => true, message: "numbers only: 1234567890"}, 
    length: {is: 10, message: "is the wrong length (should be 10 digits)"} 

  validates :phone_work, 
    :numericality => {:only_integer => true, message: "enter numbers only: 1234567890"}, 
    length: {is: 10, message: "is the wrong length (should be 10 digits)"}
 
  def increment_package_count
    self.package_count = self.package_count.to_i + 1
  end

  def decrement_package_count
    self.package_count = self.package_count.to_i - 1
  end

end