require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

	def setup
		@artist = artists(:michael)
		remember(@artist)
	end
	
	test "current_artist returns right artist when session is nil" do
		assert_equal @artist, current_artist
		assert is_logged_in?
	end

	test "current_user returns nil when remember digest is wrong" do
		@artist.update_attribute(:remember_digest, Artist.digest(Artist.new_token))
		assert_nil current_artist
	end
end
