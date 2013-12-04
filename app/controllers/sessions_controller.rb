class SessionsController < ApplicationController
	def new
	end

	# Sets users session information
	def create
		# Finds user by email (downcase)
		user = User.find_by(email: params[:session][:email].downcase)
		# Authenticates email with password
		# If successfull, sign user in and redirect to events page
		if user && user.authenticate(params[:session][:password])
	    	sign_in user
	    	redirect_to events_path
		else
			# If username and password does not match, sends error and redirects user to homepage
		    flash.now[:error] = 'Invalid email/password combination'
		    redirect_to root_url
		end
	end

	# User Sign Out
	# Destroys session details
	def destroy
	    sign_out
	    redirect_to root_url		
	end	
end
