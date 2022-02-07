class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :status
      t.integer :location
      t.integer :paranoia
      t.integer :goodwill
      t.integer :intrigue
      t.boolean :friended, default: false, null: false
      t.boolean :deaded, default: false, null: false
      t.integer :board_id
      t.integer :za_id
      t.integer :position_id

      t.timestamps
    end
  end
end
