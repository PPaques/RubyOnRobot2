require 'test_helper'

class WorkingOperationsControllerTest < ActionController::TestCase
  setup do
    @working_operation = working_operations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:working_operations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create working_operation" do
    assert_difference('WorkingOperation.count') do
      post :create, working_operation: { operation_id: @working_operation.operation_id, position: @working_operation.position, robot_id: @working_operation.robot_id, run_until: @working_operation.run_until, started_at: @working_operation.started_at, status: @working_operation.status }
    end

    assert_redirected_to working_operation_path(assigns(:working_operation))
  end

  test "should show working_operation" do
    get :show, id: @working_operation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @working_operation
    assert_response :success
  end

  test "should update working_operation" do
    put :update, id: @working_operation, working_operation: { operation_id: @working_operation.operation_id, position: @working_operation.position, robot_id: @working_operation.robot_id, run_until: @working_operation.run_until, started_at: @working_operation.started_at, status: @working_operation.status }
    assert_redirected_to working_operation_path(assigns(:working_operation))
  end

  test "should destroy working_operation" do
    assert_difference('WorkingOperation.count', -1) do
      delete :destroy, id: @working_operation
    end

    assert_redirected_to working_operations_path
  end
end
