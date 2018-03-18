require 'test_helper'

class AdmintopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admintops_index_url
    assert_response :success
  end

end
