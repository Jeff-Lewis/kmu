class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :userid, :password, :lastname, :name, :adress1, :adress2, :adress3, :phone1, :phone2, :org, :title, :costrate, :costinfo1, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :userid, :password, :lastname, :name, :adress1, :adress2, :adress3, :phone1, :phone2, :org, :title, :costrate, :costinfo1, :avatar)
  end
end