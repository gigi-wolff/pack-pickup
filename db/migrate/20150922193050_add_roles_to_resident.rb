class AddRolesToResident < ActiveRecord::Migration
  def change
    add_column :residents, :role, :string
  end
end
