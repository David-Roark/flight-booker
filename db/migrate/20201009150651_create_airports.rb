class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.string :airport_name, null: false
      t.string :airport_code, null: false, unique: true

      t.timestamps
    end
  end
end
