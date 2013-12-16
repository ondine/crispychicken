ActionMailer::Base.smtp_settings = {
  :to => 'Crispy_Chicken@live.com',
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.live.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'Crispy_Chicken@live.com',
    :password             => 'Chispa888',
    :authentication       => :plain # :plain, :login, :cram_md5, no auth by default    
  }
}


