class RemoveDateAvailableFromApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :date_available
  end
end
