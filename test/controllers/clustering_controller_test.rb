require 'test_helper'

class ClusteringControllerTest < ActionDispatch::IntegrationTest
  test "should get brand" do
    get clustering_brand_url
    assert_response :success
  end

  test "should get score" do
    get clustering_score_url
    assert_response :success
  end

end
