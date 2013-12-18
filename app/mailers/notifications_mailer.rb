class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@maryfjenn.com"
  default :to => "maryfjenn@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "Feedback")
  end

end