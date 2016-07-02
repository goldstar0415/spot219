class CreatePackageOptions < ActiveRecord::Migration
  def change
    create_table :package_options do |t|
      t.references :package, index: true, foreign_key: true
      t.string :interval
      t.money :price_cents

      t.timestamps null: false
    end
  end
end
