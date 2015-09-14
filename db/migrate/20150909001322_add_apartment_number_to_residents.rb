class AddApartmentNumberToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :apartment_number, :string
  end
end
