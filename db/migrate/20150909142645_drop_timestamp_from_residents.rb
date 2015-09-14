class DropTimestampFromResidents < ActiveRecord::Migration
  def change
    remove_column :residents, :timestamp
  end
end
