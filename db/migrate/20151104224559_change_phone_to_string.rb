class ChangePhoneToString < ActiveRecord::Migration
  def change
    change_column :residents, :phone_personal, :string
    change_column :residents, :phone_work, :string
  end
end
