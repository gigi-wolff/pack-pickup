class AddTimestampToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :timestamp, :datetime
  end
end
