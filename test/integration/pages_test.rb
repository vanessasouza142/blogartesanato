require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    get root_path
    assert_response :success
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end  
end
