require 'test_helper'

class PerturbationsControllerTest < ActionController::TestCase
  setup do
    @perturbation = perturbations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perturbations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perturbation" do
    assert_difference('Perturbation.count') do
      post :create, perturbation: { description: @perturbation.description, name: @perturbation.name, operation_id: @perturbation.operation_id, robot_id: @perturbation.robot_id, status_id: @perturbation.status_id }
    end

    assert_redirected_to perturbation_path(assigns(:perturbation))
  end

  test "should show perturbation" do
    get :show, id: @perturbation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @perturbation
    assert_response :success
  end

  test "should update perturbation" do
    put :update, id: @perturbation, perturbation: { description: @perturbation.description, name: @perturbation.name, operation_id: @perturbation.operation_id, robot_id: @perturbation.robot_id, status_id: @perturbation.status_id }
    assert_redirected_to perturbation_path(assigns(:perturbation))
  end

  test "should destroy perturbation" do
    assert_difference('Perturbation.count', -1) do
      delete :destroy, id: @perturbation
    end

    assert_redirected_to perturbations_path
  end
end
