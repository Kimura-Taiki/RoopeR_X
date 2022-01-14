class CreateRulePositionOwns < ActiveRecord::Migration[5.2]
  def change
    create_table :rule_position_owns do |t|
      t.integer :rule_id
      t.integer :position_id

      t.timestamps
    end
  end
end
