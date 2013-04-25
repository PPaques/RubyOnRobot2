require 'test_helper'

class OperationGenericsControllerTest < ActionController::TestCase
  setup do
    @operation_generic = operation_generics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operation_generics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operation_generic" do
    assert_difference('OperationGeneric.count') do
      post :create, operation_generic: { class_name: @operation_generic.class_name, decription: @operation_generic.decription, function_name: @operation_generic.function_name, name: @operation_generic.name, parameters: @operation_generic.parameters, robot_id: @operation_generic.robot_id }
    end

    assert_redirected_to operation_generic_path(assigns(:operation_generic))
  end

  test "should show operation_generic" do
    get :show, id: @operation_generic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operation_generic
    assert_response :success
  end

  test "should update operation_generic" do
    put :update, id: @operation_generic, operation_generic: { class_name: @operation_generic.class_name, decription: @operation_generic.decription, function_name: @operation_generic.function_name, name: @operation_generic.name, parameters: @operation_generic.parameters, robot_id: @operation_generic.robot_id }
    assert_redirected_to operation_generic_path(assigns(:operation_generic))
  end

  test "should destroy operation_generic" do
    assert_difference('OperationGeneric.count', -1) do
      delete :destroy, id: @operation_generic
    end

    assert_redirected_to operation_generics_path
  end
end
