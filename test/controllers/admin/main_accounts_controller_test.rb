require 'test_helper'

class Admin::MainAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_main_accounts_index_url
    assert_response :success
  end

end
