class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :status,    default: 1
      t.integer :location
      t.integer :first_location
      t.integer :paranoia,  default: 0
      t.integer :goodwill,  default: 0
      t.integer :intrigue,  default: 0
      t.boolean :friended,  default: false, null: false
      t.boolean :deaded,    default: false, null: false
      t.integer :board_id
      t.integer :za_id
      t.integer :position_id

      t.timestamps
    end
  end
end
