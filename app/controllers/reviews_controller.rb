class ReviewsController < ApplicationController
  def index
    @order = Order.first
    product_ids = []
    current_user.orders.each do |order|
      order.order_items.each do |o_item|
        product_ids.push(o_item.variant.product.id)
      end
    end
    @user = current_user
    @products = []
    product_ids.uniq.each do |product_id|
      @products.push(Product.find(product_id))
    end
    @count = Hash.new
    @rates = Hash.new
    @values = Array.new(6) {Array.new(1000)}
    for i in 0..5
      for j in 0..1000
        @values[i][j] = 0
      end
    end
    @user_rates = [0,0,0,0,0,0]
    @user_counts = [0,0,0,0,0,0]
    user_review = OrderReview.new
    @user_reviews = []
    OrderReview.all.each do |or_item|
      if or_item.rating!=nil and or_item.product_id!=nil
        @values[or_item.rating][or_item.product_id] += 1
        if @count.has_key?(or_item.product_id)
          @count[or_item.product_id] += 1
        else
          @count[or_item.product_id] = 1
        end
        if @rates.has_key?(or_item.product_id)
          @rates[or_item.product_id] += or_item.rating
        else
          @rates[or_item.product_id] = or_item.rating
        end
        
        if or_item.user_id == current_user.id
          @user_counts[or_item.product_id] += 1
          @user_rates[or_item.product_id] += or_item.rating
          user_review = or_item
          @user_reviews[or_item.product_id] = user_review
        else
        end
      else
      end
    end

    @brand_list = []
    Brand.all.each do |b_item|
      @brand_list.push(b_item)
    end
  #  @country_name = current_user.payment_profiles.first.addresses.first.countries.first.name
  end

  def create
    if params[:review] && params[:review].present?
      new_review = OrderReview.new
      new_review.rating = params[:review][:rating]
      new_review.title = params[:review][:title]
      new_review.content = params[:review][:content]
      new_review.product_id = params[:review][:product_id]
      new_review.user_id = params[:review][:user_id]
      new_review.save
    end

    render :template => '/products/index'
  end
end
