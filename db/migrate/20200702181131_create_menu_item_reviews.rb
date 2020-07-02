class CreateMenuItemReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_item_reviews do |t|
      t.integer :user_id
      t.integer :menu_item_id
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
