class AddSlugToRegions < ActiveRecord::Migration[8.0]
  def change
    add_column :regions, :slug, :string
    add_index :regions, :slug, unique: true
  end
end
