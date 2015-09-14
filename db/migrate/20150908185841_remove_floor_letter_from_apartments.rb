class RemoveFloorLetterFromApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :floor
    remove_column :apartments, :letter
  end
end
