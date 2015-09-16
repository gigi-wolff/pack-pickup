class Package < ActiveRecord::Base
  belongs_to :resident
  belongs_to :apartment

  validates :arrived, presence: true
  #validates_date :arrived, :on_or_before => lambda { Date.current }

end