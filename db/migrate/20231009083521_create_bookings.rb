class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.integer :pax
      t.boolean :confirmed, default: true
      t.decimal :price, :precision => 15, :scale => 10

      t.timestamps
    end
  end
end
