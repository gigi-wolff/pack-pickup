class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :apartment_number
      t.integer :floor
      t.string :letter
      t.string :description
      t.integer :rent
      t.datetime :date_available
      t.timestamps
    end
  end
end
