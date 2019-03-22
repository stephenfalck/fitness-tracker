require 'test_helper'

class Activity::BuildControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get activity_build_controller_show_url
    assert_response :success
  end

  test "should get update" do
    get activity_build_controller_update_url
    assert_response :success
  end

end
