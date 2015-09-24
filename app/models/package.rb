class Package < ActiveRecord::Base
  belongs_to :resident
  belongs_to :apartment

  validates :arrived, presence: true
=begin
  after_save :increment_package_count
  after_update :decrement_package_count

  protected
  def increment_package_count
    self.resident.package_count = self.resident.package_count.to_i + 1
  end

  def decrement_package_count
    self.resident.package_count = self.resident.package_count.to_i - 1
  end
=end
end