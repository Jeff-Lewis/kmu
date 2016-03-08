class UserMailer < ApplicationMailer

  default from: "horst.wurm63.gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    puts "YES I try to send an email....to..."+user.email
    #necessary to access in view
    @user = user
    mail to: @user.email, 
    subject: "Sign Up Confirmation"
  end
end
