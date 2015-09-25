require 'test_helper'

class ArtistsLoginTest < ActionDispatch::IntegrationTest

	def setup
		@artist = artists(:michael)
	end

	test "login with valid information followed by logout" do
		get login_path
		post login_path, session: { email: @artist.email, password: 'password' }
		assert is_logged_in?
		assert_redirected_to @artist
		follow_redirect!
		assert_template 'artists/show'
		assert_select "a[href=?]", login_path, count: 0
		assert_select "a[href=?]", logout_path
		assert_select "a[href=?]", artist_path(@artist)
		delete logout_path
		assert_not is_logged_in?
		assert_redirected_to root_url
		# Simulate a artist clicking logout in a second window.
		delete logout_path
		follow_redirect!
		assert_select "a[href=?]", login_path
		assert_select "a[href=?]", logout_path, count: 0
		assert_select "a[href=?]", artist_path(@artist), count: 0
	end

	test "login with remembering" do
		log_in_as(@artist, remember_me: '1')
		assert_not_nil cookies['remember_token']
	end
		test "login without remembering" do
		log_in_as(@artist, remember_me: '0')
		assert_nil cookies['remember_token']
	end
end