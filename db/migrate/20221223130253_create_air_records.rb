class CreateAirRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :air_records do |t|
      t.text :trouble
      t.integer :row1
      t.integer :place
      t.date :date
      t.integer :user_id
      t.integer :air_ticket_id
    end
  end
end
