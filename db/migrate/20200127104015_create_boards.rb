# frozen_string_literal: true

# Create board table
class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :driver_name
      t.integer :car_number
      t.string :car_colour
      t.string :country
      t.decimal :last_lap, default: 0
      t.integer :position
      t.integer :interval, default: 0

      t.timestamps
    end
  end
end
