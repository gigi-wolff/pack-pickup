class Resident < ActiveRecord::Base
  belongs_to :apartment 
  has_many :packages

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_personal, presence: true
  validates :apartment_number, presence: true

end