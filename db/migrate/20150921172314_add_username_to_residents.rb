class AddUsernameToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :username, :string
  end
end
