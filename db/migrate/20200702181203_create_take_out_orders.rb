class CreateTakeOutOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :take_out_orders do |t|
      t.integer :cart_id
      t.integer :menu_item_id
      t.integer :quantity
      t.string :subtotal

      t.timestamps
    end
  end
end
