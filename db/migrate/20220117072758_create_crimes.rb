class CreateCrimes < ActiveRecord::Migration[5.2]
  def change
    create_table :crimes do |t|
      t.string :name
      t.integer :shift
      t.integer :counter

      t.timestamps
    end
  end
end
