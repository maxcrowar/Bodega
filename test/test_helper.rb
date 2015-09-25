ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Returns true if a test artist is logged in.
	def is_logged_in?
		!session[:artist_id].nil?
	end

  # Logs in a test artist.
  def log_in_as(artist, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email: artist.email,
                                  password: password,
                                  remember_me: remember_me }
    else
      session[:artist_id] = artist.id
    end
  end
  
  private
    # Returns true inside an integration test.
    def integration_test?
      defined?(post_via_redirect)
    end
end
