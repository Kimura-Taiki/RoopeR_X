class CreatePawns < ActiveRecord::Migration[5.2]
  def change
    create_table :pawns do |t|
      t.integer :script_id
      t.integer :za_id
      t.integer :role_id

      t.timestamps
    end
  end
end
