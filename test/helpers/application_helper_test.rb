require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
	test "Shortify helper" do
		# Short string should return the same string. 
		assert_equal shortify('s' * 10, 20), 's' * 10
		# Long string should return substr + dots.
		assert_equal  shortify('s' * 30, 20), 's' * 20 + '...'
	end
end
