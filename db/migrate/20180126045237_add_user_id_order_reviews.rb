class AddUserIdOrderReviews < ActiveRecord::Migration[5.1]
  def change
  	add_column :order_reviews, :user_id, :integer
  end
end
