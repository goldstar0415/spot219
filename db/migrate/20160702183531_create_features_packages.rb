class CreateFeaturesPackages < ActiveRecord::Migration
  def change
    create_table :features_packages do |t|
      t.references :feature, index: true, foreign_key: true
      t.references :package, index: true, foreign_key: true
    end
  end
end
