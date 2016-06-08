class UserMailer < ApplicationMailer

  default from: "horst.wurm63.gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def send_message(to_user, from_user, subject, message)
    @to_user = to_user
    @from_user = from_user
    @message = message
    @subject = subject
    mail to: @to_user.email, subject: @subject
  end
end
