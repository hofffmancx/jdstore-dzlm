class CartsController < ApplicationController
    layout "navbarview"
  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end

  def show
    @order = Order.find_by_token(params[:id])   
    @product_lists = @order.product_lists 
  end 

  private

   def order_params
     params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method)
   end

end
