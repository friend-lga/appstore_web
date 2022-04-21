require "test_helper"

class AdvertiserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get advertiser_index_url
    assert_response :success
  end
end
