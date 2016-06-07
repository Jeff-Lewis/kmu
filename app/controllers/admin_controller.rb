class AdminController < ApplicationController
  def showmap
    @user = User.find(params[:user])
  end

  def sendmail
  end
end
