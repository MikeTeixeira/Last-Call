class RestaurantsController < ApplicationController


  before_action :set_restaurant, only: [ :update, :menu, :submit_menu, :my_restaurant, :my_menu]

  # before_action :set_order, only: [:submit_order]
  # GET /restaurants
  # Show list of all restaurants
  def index
    @restaurants = Restaurant.all
    if params[:search]
      @restaurants = Restaurant.search(params[:search]).order("created_at DESC")
    else
      @restaurants = Restaurant.all.order("created_at DESC")
    end
  end

  # GET /restaurants/1
  # Show restaurant profile
  def show
    @restaurant = Restaurant.find(params[:id])
    
  end

  # GET /restaurants/new
  # Create a new restaurant form
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  # Edit restaurant information (for admins) form
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # Show menu items
  # See menu items for restaurant
  def menu
    @menu_items = MenuItem.where(restaurant_id: params[:restaurant_id])
    @restaurants = Restaurant.find(params[:restaurant_id])

  end


  # Show current users restaurants
  def my_restaurants
    render :personal_restaurants
  end

  #Show current users restaurant
  def my_restaurant
    @orders = current_user.orders.where(restaurant_id: params[:restaurant_id])
    @menu_items = MenuItem.where(restaurant_id: params[:restaurant_id] )
    render :personal_restaurant
    # @appetizers = MenuItem.where(@menu_items.categories === [0])
  end


  def my_menu
    render :personal_menu
  end

  # POST order into the menu_item_order table
  def create_order
    @order = Order.create
  end


  # POST /menu/:restaurant_id
  # Submit menu item orders
  # Since order id was already created for menu_item_order, 
  # we have to find the order and update the rest of the params
  def submit_menu
    @order = Order.create! user_id: current_user.id, restaurant_id: @restaurant.id

    params[:order].each do |order_item|
        MenuItemOrder.create(order_id: @order.id, menu_item_id: params[:order][order_item][:item], quantity: params[:order][order_item][:quantity])
    end
    respond_to do |format|
        format.html { redirect_to new_order_path(@restaurant), notice: 'Menu items were successfully submitted.' }
        format.json { render :new, status: :created, location: @order }
    end
  end

  # POST /restaurants
  # Create new restaurant
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to my_restaurant_path(current_user, @restaurant.id), notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  # Edit restaurant
  def update
    @restaurant = Restaurant.find(params[:id])
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to user_restaurant_url(current_user), notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  # Delete restaurant
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id] || params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:order_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params

      params.require(:restaurant).permit(:name, :description, :phone_number, :address, :state, :category, :city, :zipcode, :open_hours, :close_hours,:latitude,:longitude,:image ) 

    end
end
