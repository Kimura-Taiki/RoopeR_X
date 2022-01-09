class CreateScripts < ActiveRecord::Migration[5.2]
  def change
    create_table :scripts do |t|
      t.string :name
      t.integer :noof_days
      t.integer :noof_weeks

      t.timestamps
    end
  end
end
