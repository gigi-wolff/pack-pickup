class ReaddTimestampToResidents < ActiveRecord::Migration
  def change
    add_timestamps :residents
  end
end
