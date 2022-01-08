# https://guides.rubyonrails.org/v3.2/testing.html
require "test_helper"
# LOAD FRESH TEST DATA TO TEST DB
# $ rake db:migrate
# $ rake db:test:load
# rake db:test:prepare	Check for pending migrations and load the test schema

class BeerTest < ActiveSupport::TestCase

  # all methods that begin with 'test' are automatically run when the test case is run
  # test "should not save beer without brand" is the same as writing def test_should_not_save_beer_without_brand
  def test_should_not_save_beer_without_brand
  # test "should not save beer without brand" do
    beer = Beer.new
    # use assertions to evaluate an object or expression. e.g
    # does this value = that value?
    # is this object nil?
    # does this line of code throw an exception?
    # is the user’s password greater than 5 characters?
    # all assetions must pass for test to pass
    assert_not beer.save , "did not save the beer without a brand" # this message shows in the test output if the test fails
    beer.brand = 'nonono'
    assert beer.save , "did save the beer with a brand"
  end

  test "should destroy beer" do
    beer = Beer.new
    assert beer.destroy
  end

  test "should have label method" do
    beer = Beer.new
    assert beer.addCustomLabel("blue")
  end

  test "should add label to beer" do
    beer = Beer.new
    beer.image = "image"
    beer.addCustomLabel("blue")
    assert_equal beer.image, "blue"
  end

end
