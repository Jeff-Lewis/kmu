class HomeController < ApplicationController

def index
  if user_signed_in?
    redirect_to current_user
  end
  if params[:message] != nil
    @message = params[:message]
    puts "trying to send eMail with  USERID:" + ENV["GMAIL_USERNAME"] + " PASSWORD:"+ ENV["GMAIL_PASSWORD"] + "SUBJECT:" + @message
    UserMailer.signup_confirmation(User.find(current_user.id),@message).deliver_now
  end 
end

def dashboard
  @workorders=Workorder.all
end

end
