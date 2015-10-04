class Package < ActiveRecord::Base
  belongs_to :resident
  belongs_to :apartment

  validates :arrived, presence: true
  validates :picked_up, presence: true, on: :update

end