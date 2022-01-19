class CreateParuos < ActiveRecord::Migration[5.2]
  def change
    create_table :paruos do |t|
      t.integer :package_id
      t.integer :rule_id

      t.timestamps
    end
  end
end
