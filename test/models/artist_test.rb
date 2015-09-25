require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	def setup
		@artist = Artist.new(name: "Example User", email: "artist@example.com",
		password: "foobar", password_confirmation: "foobar")
	end

	test "authenticated? should return false for a artist with nil digest" do
		assert_not @artist.authenticated?('')
	end
end
