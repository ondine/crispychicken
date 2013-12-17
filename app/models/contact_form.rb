class ContactForm < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :additional_field,  :captcha  => true

  append :remote_ip, :user_agent, :session

  def headers
    {
      :subject => "Web Inquiry",
      :to => "Crispy_Chicken@live.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end