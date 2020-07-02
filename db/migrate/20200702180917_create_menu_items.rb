class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.boolean :chef_specialty, default: false
      t.boolean :vegan, default: false
      t.integer :menu_id
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
