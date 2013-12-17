 class ContactForm < MailForm
   append :remote_ip, :user_agent, :session
  subject "Web Inquiry"
  recipients "Crispy_Chicken@live.com"
  sender{|c| %{"#{c.name}" <#{c.email}>} }

  attribute :name,      :validate => true
  attribute :email,     :validate => /[^@]+@[^\.]+\.[\w\.\-]+/
  
  attribute :message
  attribute :nickname,  :captcha  => true
end