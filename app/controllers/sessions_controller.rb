class SessionsController < ApplicationController
	def new
	end

	# Sets users session information
	def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            sign_in user
            redirect_to events_path
        else
            flash.now[:error] = 'Invalid email/password combination'
            render 'new'
        end		
	end

	def login
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to events_path
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
