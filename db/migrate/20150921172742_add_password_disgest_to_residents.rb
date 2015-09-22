class AddPasswordDisgestToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :password_digest, :string
  end
end
