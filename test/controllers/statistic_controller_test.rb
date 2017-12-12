require 'test_helper'

class StatisticControllerTest < ActionDispatch::IntegrationTest
  test "should get brand" do
    get statistic_brand_url
    assert_response :success
  end

  test "should get product" do
    get statistic_product_url
    assert_response :success
  end

end
