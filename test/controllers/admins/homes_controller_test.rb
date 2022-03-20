require "test_helper"

class Admins::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_homes_index_url
    assert_response :success
  end
end
