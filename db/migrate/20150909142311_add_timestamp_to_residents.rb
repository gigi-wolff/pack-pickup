class AddTimestampToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :timestamp, :datetime
  end
end
