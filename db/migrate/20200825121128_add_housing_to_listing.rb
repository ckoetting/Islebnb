class AddHousingToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :bedrooms, :integer
    add_column :listings, :bathrooms, :integer
    add_column :listings, :house_type, :string
    add_column :listings, :max_guests, :integer
  end
end
