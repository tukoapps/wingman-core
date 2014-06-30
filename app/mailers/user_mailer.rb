class UserMailer < ActionMailer::Base
  default from: "\"WingMan\" <suggestions@get-wingman.com>"
 
  def welcome_email(email)
    @email = email
    mail(to: @email, subject: 'Welcome to WingMan!')
  end
end
