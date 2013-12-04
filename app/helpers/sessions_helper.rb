module SessionsHelper
  # Sign in user
  # Remembers users login details
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end	

  # Checks if user is signed in
  def signed_in?
    !current_user.nil?
  end  

  # Sets current user
  def current_user=(user)
    @current_user = user
  end  

  # Sets current user based on token if available
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # Signs user out
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
