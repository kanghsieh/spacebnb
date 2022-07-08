class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :planet, null: false, foreign_key: true
      t.references :spaceship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
