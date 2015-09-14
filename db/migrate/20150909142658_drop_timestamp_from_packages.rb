class DropTimestampFromPackages < ActiveRecord::Migration
  def change
    remove_column :packages, :timestamp
  end
end
