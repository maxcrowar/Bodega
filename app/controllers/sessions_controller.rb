class SessionsController < ApplicationController
  def new
  end

  def create
  	artist = Artist.find_by(name: params[:name])
		if artist and artist.authenticate(params[:password])
			session[:artist_id] = artist.id
			redirect_to admin_url
		else
			redirect_to login_url, alert: "Invalid user/password combination"
		end
  end

  def destroy
  	session[:artist_id] = nil
		redirect_to work_url, notice: "Logged out"
  end
end
