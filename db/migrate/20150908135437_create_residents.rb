class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :first_name
      t.string :last_name
      t.integer :personal_phone
      t.integer :work_phone 
      t.integer :apartment_id
    end
  end
end
