class CreatePassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :booking_id, null: false

      t.timestamps
    end
  end
end
