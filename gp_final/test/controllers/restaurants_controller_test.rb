require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { close_hours: @restaurant.close_hours, description: @restaurant.description, location: @restaurant.location, menu_item_id: @restaurant.menu_item_id, name: @restaurant.name, open_hours: @restaurant.open_hours, phone_number: @restaurant.phone_number, rating_id: @restaurant.rating_id } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { close_hours: @restaurant.close_hours, description: @restaurant.description, location: @restaurant.location, menu_item_id: @restaurant.menu_item_id, name: @restaurant.name, open_hours: @restaurant.open_hours, phone_number: @restaurant.phone_number, rating_id: @restaurant.rating_id } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_url
  end
end
