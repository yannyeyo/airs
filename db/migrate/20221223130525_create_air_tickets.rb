class CreateAirTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :air_tickets do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :price, null: false
    end
    add_index :air_tickets, :title, unique: true
  end
end
