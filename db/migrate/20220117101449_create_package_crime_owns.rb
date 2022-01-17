class CreatePackageCrimeOwns < ActiveRecord::Migration[5.2]
  def change
    create_table :package_crime_owns do |t|
      t.integer :package_id
      t.integer :crime_id

      t.timestamps
    end
  end
end
