module ArtistsHelper

	# Returns the Gravatar for the given artist.
	def gravatar_for(artist)
		gravatar_id = Digest::MD5::hexdigest(artist.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: artist.name, class: "gravatar")
	end
end
