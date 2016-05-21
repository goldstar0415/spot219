class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.string :email,              null: false, default: ""
      t.string :first_name,         default: ""
      t.string :last_name,          default: ""
      t.attachment :proof
      t.string :phone
      t.text :reason
      t.integer :status
      t.integer :user_id
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
