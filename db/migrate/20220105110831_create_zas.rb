class CreateZas < ActiveRecord::Migration[5.2]
  def change
    create_table :zas do |t|
      t.string :name
      t.integer :paranoia_limit
      t.string :image_id

      t.timestamps
    end
  end
end
