class DropLikesTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :likes
  end

  def down
    create_table :likes do |t|
      t.references :likeable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
