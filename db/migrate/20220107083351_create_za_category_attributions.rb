class CreateZaCategoryAttributions < ActiveRecord::Migration[5.2]
  def change
    create_table :za_category_attributions do |t|
      t.integer :za_id
      t.integer :category_id

      t.timestamps
    end
  end
end
