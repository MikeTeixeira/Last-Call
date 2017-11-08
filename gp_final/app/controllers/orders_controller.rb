class OrdersController < ApplicationController
  before_action :set_order, only: [:new, :show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:new]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new to take client information for the order
  # Since order id was already created for menu_item_order, 
  # we have to find the order and update the rest of the params
  def new

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    # @postmates_order = @order.postmates_client.create(order_params)
    # @postmates_quote = @order.postmates_client.quote(quote_params)

    respond_to do |format|
      if @postmates_order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
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
      @order = Order.find(id: params[:order])
    end

    def set_restaurant
      @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :restaurant_id, :pickup_address, :pickup_phone_number, :pickup_business_name, :dropoff_name, :dropoff_address, :dropoff_phone_number, :dropoff_business_name, :dropoff_notes)
    end

    def quote_params
      params.require(:order).permit(:pickup_address, :dropoff_address)
    end

end
