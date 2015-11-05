class FixPhoneColumnName < ActiveRecord::Migration
  def change
    rename_column :residents, :phone_personal, :personal_phone
    rename_column :residents, :phone_work, :work_phone
  end
end
