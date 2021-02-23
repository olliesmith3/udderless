class AddFrequencyToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :frequency, :integer
  end
end
