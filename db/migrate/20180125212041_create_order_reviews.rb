class CreateOrderReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :order_reviews do |t|
      t.string :title
      t.string :content
      t.float :rating
      t.integer :product_id
      t.timestamps
    end
  end
end
