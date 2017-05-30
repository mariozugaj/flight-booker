require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test "should get flights" do
    get flights_flights_url
    assert_response :success
  end

end
