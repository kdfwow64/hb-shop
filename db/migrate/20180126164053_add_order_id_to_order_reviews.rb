class AddOrderIdToOrderReviews < ActiveRecord::Migration[5.1]
  def change
  	add_column :order_reviews, :order_id, :integer
  end
end
