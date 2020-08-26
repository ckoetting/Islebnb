class AddMoreDataToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :number_of_guests, :integer
    add_column :bookings, :full_name, :string
    add_column :bookings, :age, :integer
  end
end
