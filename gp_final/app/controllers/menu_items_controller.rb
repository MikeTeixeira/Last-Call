class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:edit, :update]
  before_action :set_restaurant, only: [:new, :create]

  # GET /menu_items
  # GET /menu_items.json
  def index
    @menu_items = MenuItem.all
  end

  # GET /menu_items/1
  # GET /menu_items/1.json
  def show

  end

  # GET /menu_items/new
  def new
    @menu_item = MenuItem.new
  end

  # GET /menu_items/1/edit
  def edit
    @categories = MenuItem.categories
  end

  # POST /menu_items
  # POST /menu_items.json
  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.restaurant = @restaurant
    respond_to do |format|
      if @menu_item.save!
        format.html { redirect_back fallback_location: root_path,   notice: 'Menu item was successfully created.' }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_items/1
  # PATCH/PUT /menu_items/1.json
  def update
    @restaurant = Restaurant.find_by(params[:id])
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to my_restaurant_path(current_user, @restaurant.id), notice: 'Menu item was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.json
  def destroy
    @menu_item = MenuItem.find(params[:id])
    restaurant = @menu_item.restaurant
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to my_restaurant_path(current_user, restaurant.id), notice: 'Menu item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    def set_restaurant
      @restaurant =  Restaurant.find(params[:restaurant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_item_params
      params.require(:menu_item).permit(:restaurant_id, :user_id, :name, :category, :price, :description, :status)
    end
end
