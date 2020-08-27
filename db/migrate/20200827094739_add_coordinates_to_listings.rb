class AddCoordinatesToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :l, :string
  end
end
