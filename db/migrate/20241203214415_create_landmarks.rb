class CreateLandmarks < ActiveRecord::Migration[8.0]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
