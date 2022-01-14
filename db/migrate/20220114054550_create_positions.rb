class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :max
      t.integer :refusal
      t.integer :unkillable
      t.integer :obstinate

      t.timestamps
    end
  end
end
