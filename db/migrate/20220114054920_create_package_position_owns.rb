class CreatePackagePositionOwns < ActiveRecord::Migration[5.2]
  def change
    create_table :package_position_owns do |t|
      t.integer :package_id
      t.integer :position_id

      t.timestamps
    end
  end
end
