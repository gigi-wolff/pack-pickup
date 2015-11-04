class Apartment < ActiveRecord::Base
  has_many :residents

  validates_presence_of :rent, :description

  #validates :apartment_number, presence: true
  validates :apartment_number, presence: true, inclusion: {in: %w(1A 1B 1C 2A 2B 2C),
    message: "invalid"}
 
end
 