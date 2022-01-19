class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.integer :day
      t.integer :script_id
      t.integer :pawn_id
      t.integer :crime_id

      t.timestamps
    end
  end
end
