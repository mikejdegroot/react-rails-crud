require "test_helper"

# this integration test tests our api endpoint response
class Api::V1::BeersControllerTest < ActionDispatch::IntegrationTest

  test "index request returns json" do
    # beer = beers(:one)
    get "/api/v1/beers/index", xhr: true
  
    # returns a 200 res
    assert_response :success
    # it sends json back
    assert_equal "application/json; charset=utf-8", @response.content_type
  end

  test "POST create creates a resource" do
    post( "/api/v1/beers/create", params: { 'brand' => "corona" }, xhr: true)

    # returns a 200 res
    assert_response :success
    # it sends json back
    assert_equal "application/json; charset=utf-8", @response.content_type
    body = JSON.parse(response.body)
    # returned object matches the passed in name
    assert_equal "corona", body["brand"]
  end
end
