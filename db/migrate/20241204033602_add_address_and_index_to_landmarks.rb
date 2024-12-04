class AddAddressAndIndexToLandmarks < ActiveRecord::Migration[8.0]
  def change
    add_column :landmarks, :address, :string
    
    add_index :landmarks, [:latitude, :longitude]
  end
end
