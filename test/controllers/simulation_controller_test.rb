require 'test_helper'

class SimulationControllerTest < ActionController::TestCase
  test "should get intro" do
    get :intro
    assert_response :success
  end

  test "should get schedule_input" do
    get :schedule_input
    assert_response :success
  end

  test "should get schedule_list" do
    get :schedule_list
    assert_response :success
  end

  test "should get initialize_sim" do
    get :initialize_sim
    assert_response :success
  end

  test "should get tick_sim" do
    get :tick_sim
    assert_response :success
  end

  test "should get result_show" do
    get :result_show
    assert_response :success
  end

end
