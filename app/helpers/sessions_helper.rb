module SessionsHelper
	# Logs in the given artist.
	def log_in(artist)
		session[:artist_id] = artist.id
	end

	# Remembers a artist in a persistent session.
	def remember(artist)
		artist.remember
		cookies.permanent.signed[:artist_id] = artist.id
		cookies.permanent[:remember_token] = artist.remember_token
	end

	# Returns the artist corresponding to the remember token cookie.
	def current_artist
		if (artist_id = session[:artist_id])
			@current_artist ||= Artist.find_by(id: artist_id)
		elsif (artist_id = cookies.signed[:artist_id])
			artist = Artist.find_by(id: artist_id)
			if artist && artist.authenticated?(cookies[:remember_token])
				log_in artist
				@current_artist = artist
			end
		end
	end

	# Returns true if the artist is logged in, false otherwise.
	def logged_in?
		!current_artist.nil?
	end

	# Forgets a persistent session.
	def forget(artist)
		artist.forget
		cookies.delete(:artist_id)
		cookies.delete(:remember_token)
	end

	# Logs out the current artist.
	def log_out
		forget(current_artist)
		session.delete(:artist_id)
		@current_artist = nil
	end
end
