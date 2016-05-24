class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :order_details, :quantiy, :quantity
  end
end
