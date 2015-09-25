class SessionsController < ApplicationController
  def new
  end

  def create
  	artist = Artist.find_by(email: params[:session][:email].downcase)
		if artist and artist.authenticate(params[:session][:password])
			log_in artist
      params[:session [:remember_me] == '1' ? remember(artist) : forget(artist)
			redirect_to artist
		else
			flash.now[:danger] = 'Invalid user/password combination'
      render 'new'
		end
  end

  def destroy
  	log_out if logged_in?
		redirect_to root_url
  end
end
