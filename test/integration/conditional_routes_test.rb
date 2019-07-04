require 'test_helper'

class ConditionalRoutesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'User should see different home when loggued-in.' do
    get '/'
    assert_select 'h1', 'AWS Community'
    sign_in users(:mauro)
    get '/'
    assert_select 'h1', { count: 0, text: 'AWS Community' }
    sign_out :user
    get '/'
    assert_select 'h1', 'AWS Community'
  end
end
