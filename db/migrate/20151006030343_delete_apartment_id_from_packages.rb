class DeleteApartmentIdFromPackages < ActiveRecord::Migration
  def change
    remove_column :packages, :apartment_id
  end
end
