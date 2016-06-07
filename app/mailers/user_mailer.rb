class UserMailer < ApplicationMailer

  default from: "horst.wurm63.gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user, message)
    @user = user
    @message = message
    mail to: @user.email, 
    subject: "newKMU Sign In Confirmation"
  end
end
