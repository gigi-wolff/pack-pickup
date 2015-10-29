class AddSlugToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :slug, :string
  end
end
