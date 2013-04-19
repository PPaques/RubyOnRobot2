require 'test_helper'

class StatusGpiosControllerTest < ActionController::TestCase
  setup do
    @status_gpio = status_gpios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_gpios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_gpio" do
    assert_difference('StatusGpio.count') do
      post :create, status_gpio: { gpio_id: @status_gpio.gpio_id, value: @status_gpio.value }
    end

    assert_redirected_to status_gpio_path(assigns(:status_gpio))
  end

  test "should show status_gpio" do
    get :show, id: @status_gpio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_gpio
    assert_response :success
  end

  test "should update status_gpio" do
    put :update, id: @status_gpio, status_gpio: { gpio_id: @status_gpio.gpio_id, value: @status_gpio.value }
    assert_redirected_to status_gpio_path(assigns(:status_gpio))
  end

  test "should destroy status_gpio" do
    assert_difference('StatusGpio.count', -1) do
      delete :destroy, id: @status_gpio
    end

    assert_redirected_to status_gpios_path
  end
end
