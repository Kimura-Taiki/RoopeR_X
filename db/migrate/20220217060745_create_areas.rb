class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.integer :yml
      t.string :name

      t.timestamps
    end
  end
end
