class Resident < ActiveRecord::Base
  belongs_to :apartment 
  has_many :packages

  validates :apartment_number, inclusion: {in: %w(1A 1B 1C 2A 2B 2C),
    message: "invalid"}
  validates_presence_of :first_name, :last_name

  validates :phone_personal,
    :numericality => {:only_integer => true, message: "numbers only: 1234567890"}, 
    length: {is: 10, message: "is the wrong length (should be 10 digits)"} 

  validates :phone_work, 
    :numericality => {:only_integer => true, message: "enter numbers only: 1234567890"}, 
    length: {is: 10, message: "is the wrong length (should be 10 digits)"}
 
end