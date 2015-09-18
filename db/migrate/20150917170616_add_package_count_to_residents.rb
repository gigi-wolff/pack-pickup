class AddPackageCountToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :package_count, :integer
  end
end
