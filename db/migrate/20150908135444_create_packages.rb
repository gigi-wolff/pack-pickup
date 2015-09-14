class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :package_number
      t.datetime :arrived
      t.datetime :picked_up
      t.integer :apartment_id
      t.integer :resident_id
    end
  end
end
