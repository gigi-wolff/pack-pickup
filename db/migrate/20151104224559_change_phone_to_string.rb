class ChangePhoneToString < ActiveRecord::Migration
  def change
    change_column :residents, :personal_phone, :string
    change_column :residents, :work_phone, :string
  end
end
