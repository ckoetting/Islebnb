class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :accepted
      t.references :users, foreign_key: true
      t.references :listings, foreign_key: true
      t.timestamps
    end
  end
end
