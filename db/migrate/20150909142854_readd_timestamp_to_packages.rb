class ReaddTimestampToPackages < ActiveRecord::Migration
  def change
    add_timestamps :packages
  end
end
