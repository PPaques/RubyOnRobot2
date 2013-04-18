require 'test_helper'

class RobotsControllerTest < ActionController::TestCase
  setup do
    @robot = robots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:robots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create robot" do
    assert_difference('Robot.count') do
      post :create, robot: { name: @robot.name }
    end

    assert_redirected_to robot_path(assigns(:robot))
  end

  test "should show robot" do
    get :show, id: @robot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @robot
    assert_response :success
  end

  test "should update robot" do
    put :update, id: @robot, robot: { name: @robot.name }
    assert_redirected_to robot_path(assigns(:robot))
  end

  test "should destroy robot" do
    assert_difference('Robot.count', -1) do
      delete :destroy, id: @robot
    end

    assert_redirected_to robots_path
  end
end
