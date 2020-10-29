class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :start_airport, null: false
      t.integer :finish_airport, null: false
      t.datetime :start_datetime, null: false
      t.float :flight_duration, null: false

      t.timestamps
    end
  end
end
