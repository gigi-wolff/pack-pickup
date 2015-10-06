class Package < ActiveRecord::Base
  belongs_to :resident

  validates :arrived, presence: true
  validates :picked_up, presence: true, on: :update

end