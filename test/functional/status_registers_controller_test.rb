require 'test_helper'

class StatusRegistersControllerTest < ActionController::TestCase
  setup do
    @status_register = status_registers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_registers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_register" do
    assert_difference('StatusRegister.count') do
      post :create, status_register: { register_id: @status_register.register_id, value: @status_register.value }
    end

    assert_redirected_to status_register_path(assigns(:status_register))
  end

  test "should show status_register" do
    get :show, id: @status_register
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_register
    assert_response :success
  end

  test "should update status_register" do
    put :update, id: @status_register, status_register: { register_id: @status_register.register_id, value: @status_register.value }
    assert_redirected_to status_register_path(assigns(:status_register))
  end

  test "should destroy status_register" do
    assert_difference('StatusRegister.count', -1) do
      delete :destroy, id: @status_register
    end

    assert_redirected_to status_registers_path
  end
end
