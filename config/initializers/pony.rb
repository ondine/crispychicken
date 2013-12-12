Pony.options = {
  :to => 'Crispy_Chicken@live.com',
  :via => :smtp,
  :via_options => {
    :address              => 'smtp-mail.outlook.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'Crispy_Chicken',
    :password             => 'Chispa888',
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
  }
}

