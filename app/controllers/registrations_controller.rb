class RegistrationsController < Devise::RegistrationsController
  before_action :advertiser_authenticate!
  
  def update
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    user = User.find(current_user.id)
    if user.update_attributes(resource_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in user, :bypass => true
      redirect_to edit_user_registration_path
    else
      render "edit"
    end
  end

  private

  def resource_params
    params.require(:user).permit(:name, :phone, :photo, :email, :password, :password_confirmation)
  end
end