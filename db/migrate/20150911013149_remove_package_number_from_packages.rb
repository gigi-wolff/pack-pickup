class RemovePackageNumberFromPackages < ActiveRecord::Migration
  def change
    remove_column :packages, :package_number
  end
end
