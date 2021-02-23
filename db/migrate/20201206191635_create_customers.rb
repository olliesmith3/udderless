class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :town
      t.string :county
      t.string :postcode
      t.string :email
      t.string :tel

      t.timestamps
    end
  end
end
