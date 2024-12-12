class AddSlugToLandmarks < ActiveRecord::Migration[8.0]
  def change
    add_column :landmarks, :slug, :string
    add_index :landmarks, :slug, unique: true
  end
end
