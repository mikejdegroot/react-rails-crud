require "test_helper"

class BeerTest < ActiveSupport::TestCase

  test "should not save beer without brand" do
    beer = Beer.new
    # uncomment this line to add a title and see if the record saves
    # beer.brand = 'nonono'
    assert_not beer.save , "saved the beer without a brand" # this message shows in the test output if the test fails
  end

  test "should destroy beer" do
    beer = Beer.new
    assert beer.destroy
  end

end
