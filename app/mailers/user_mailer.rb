class UserMailer < ActionMailer::Base
  default from: 'no-reply@get-wingman.com'
 
  def welcome_email(email)
    @email = email
    mail(to: @email, subject: 'Welcome to WingMan')
  end
end
