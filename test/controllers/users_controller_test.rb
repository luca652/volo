require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show_profile" do
    get users_show_profile_url
    assert_response :success
  end
end
