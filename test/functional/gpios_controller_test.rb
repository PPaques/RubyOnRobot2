require 'test_helper'

class GpiosControllerTest < ActionController::TestCase
  setup do
    @gpio = gpios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gpios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gpio" do
    assert_difference('Gpio.count') do
      post :create, gpio: { description: @gpio.description, direction: @gpio.direction, name: @gpio.name, pin: @gpio.pin, robot_id: @gpio.robot_id }
    end

    assert_redirected_to gpio_path(assigns(:gpio))
  end

  test "should show gpio" do
    get :show, id: @gpio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gpio
    assert_response :success
  end

  test "should update gpio" do
    put :update, id: @gpio, gpio: { description: @gpio.description, direction: @gpio.direction, name: @gpio.name, pin: @gpio.pin, robot_id: @gpio.robot_id }
    assert_redirected_to gpio_path(assigns(:gpio))
  end

  test "should destroy gpio" do
    assert_difference('Gpio.count', -1) do
      delete :destroy, id: @gpio
    end

    assert_redirected_to gpios_path
  end
end
