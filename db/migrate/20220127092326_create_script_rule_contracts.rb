class CreateScriptRuleContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :script_rule_contracts do |t|
      t.integer :script_id
      t.integer :rule_id

      t.timestamps
    end
  end
end
