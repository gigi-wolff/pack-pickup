class Apartment < ActiveRecord::Base
  has_many :residents

  validates :date_available, presence: true
  validates :rent, presence: true
  validates :description, presence: true
  validates :apartment_number, presence: true
end
 