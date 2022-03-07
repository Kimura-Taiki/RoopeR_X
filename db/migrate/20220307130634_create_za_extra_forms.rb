class CreateZaExtraForms < ActiveRecord::Migration[5.2]
  def change
    create_table :za_extra_forms do |t|
      t.string :name
      t.integer :za_id
      t.string :label

      t.timestamps
    end
  end
end
