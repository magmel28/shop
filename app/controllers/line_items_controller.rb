class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.find_by(product_id: product)
    if @line_item.present?
      @line_item.quantity += 1
    else
      @line_item = @cart.line_items.build(product: product)
    end

    if @line_item.save
      redirect_to cart_path, notice: 'Отличная покупка!'
    else
      redirect_to :back
    end
  end

  def increase_quantity
    line_item = LineItem.find(params[:line_item])
    @quantity = line_item[:quantity] + 1
    line_item.update_attribute(:quantity, @quantity)
    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  def decrease_quantity
    line_item = LineItem.find(params[:line_item])
    @quantity = line_item[:quantity]
    @quantity = @quantity > 0 ? @quantity - 1 : 0
    line_item.update_attribute(:quantity, @quantity)
    respond_to do |format|
      format.html{}
      format.js{}
    end
  end
end
