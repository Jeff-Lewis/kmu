class HomeController < ApplicationController

def index
#  if user_signed_in?
#    redirect_to current_user
#  end
end
def index2
    @users = User.all.order(last_sign_in_at: :desc).page(params[:page]).per_page(20)
    @usanz = @users.count
end
end
