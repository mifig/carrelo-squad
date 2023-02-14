require "test_helper"

class LocalesControllerTest < ActionDispatch::IntegrationTest
  test "should get set_en" do
    get locales_set_en_url
    assert_response :success
  end

  test "should get set_pt" do
    get locales_set_pt_url
    assert_response :success
  end
end
