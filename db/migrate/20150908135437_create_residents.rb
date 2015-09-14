class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_personal
      t.integer :phone_work 
      t.integer :apartment_id
    end
  end
end
