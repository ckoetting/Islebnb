class AddAddressToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :address, :string
    add_column :listings, :longitude, :float
    add_column :listings, :latitude, :float
  end
end
