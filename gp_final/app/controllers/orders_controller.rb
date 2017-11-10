class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:new, :update]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @quote = Order.postmates_client.quote(pickup_address: @order.pickup_address, dropoff_address: @order.dropoff_address)
  end

  # POST /orders/new to take client information for the order
  def new
    @order = current_user.orders.last

  end

  # GET /orders/1/edit
  def edit
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update!(order_params)
        @postmates_order = Order.postmates_client.create(postmates_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated. Postmates will deliver it soon.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.permit(:user_id, :restaurant_id, :pickup_address, :pickup_phone_number, :pickup_business_name).merge(params.require(:order).permit(:dropoff_name, :dropoff_address, :dropoff_phone_number, :dropoff_business_name, :dropoff_notes)) 
    end

    def postmates_params 
      params.permit(:manifest, :pickup_name, :pickup_address, :pickup_phone_number, :pickup_business_name, :pickup_notes).merge(params.require(:order).permit(:dropoff_name, :dropoff_address, :dropoff_phone_number, :dropoff_business_name, :dropoff_notes))
    end

    def set_quote
      quote_params = params.permit(:pickup_address).merge(params.require(:order).permit(:dropoff_address)).to_h
      @quote = Order.postmates_client.quote(quote_params)
    end

end
