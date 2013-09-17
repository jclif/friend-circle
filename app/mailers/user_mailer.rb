class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_email(user, password)
    @user = user
    @url = new_session_url
    @password = password
    mail(to: user.email, subject: "Be better")
  end
end
