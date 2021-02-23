class AddCancelledToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :cancelled, :boolean
  end
end
