class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to root_path, notice:
            'Thank you for your order.' }
        format.json { render action: 'show', status: :created,
                             location: @order }
      else
        @cart = current_cart
        format.html { redirect_to cart_path }
        format.json { render json: @order.errors,
                             status: :unprocessable_entity }
      end
    end
  end


  private
    def order_params
      params.require('order').permit(:name, :phone)
    end
end
