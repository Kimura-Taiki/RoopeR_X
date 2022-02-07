class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :week
      t.integer :day

      t.timestamps
    end
  end
end
