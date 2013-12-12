class SessionsController < ApplicationController
	def new
	end

	# Sets users session information
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to events_path
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
