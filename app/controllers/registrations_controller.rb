class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:status, :email, :password, :password_confirmation, :active, :anonymous, :userid, :password, :lastname, :name, :address1, :address2, :address3, :geo_address, :longitude, :latitude, :c_longitude, :c_latitude, :phone1, :phone2, :org, :title, :costrate, :costinfo1, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:status, :email, :password, :password_confirmation, :current_password, :active, :anonymous, :userid, :password, :lastname, :name, :address1, :address2, :address3, :geo_address, :longitude, :latitude, :c_longitude, :c_latitude, :phone1, :phone2, :org, :title, :costrate, :costinfo1, :avatar)
  end
end