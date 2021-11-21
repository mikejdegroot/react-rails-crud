require "test_helper"

class BeerTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save beer without brand" do
    beer = Beer.new
    assert_not beer.save , "saved the beer without a brand" # this message shows in the test output if the test fails
  end

end
