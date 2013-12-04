class UsersController < ApplicationController
	# Homepage - allows creation of user 
	def index
		@user = User.new
	end

	# Additional user account creation page
	def new 
		@user = User.new
	end

	# Creates user account based on First Name, Last Name, Email, Password, Password Confirmation
	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			# If user account is successfully created, log user in
			sign_in @user
			redirect_to events_path, :notice => "Welcome #{@user.firstname}!"
		else
			# Else redirect to home page
			redirect_to root_url
		end
	end

	def user_params
		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
	end
end
