class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :auditor_signed_in?, :advertiser_signed_in?

  protected

  def after_sign_in_path_for(resource)
    ads_path
  end

  def auditor_signed_in?
    current_user and current_user.is_a?(Auditor)
  end

  def advertiser_signed_in?
    current_user and current_user.is_a?(Advertiser)
  end

  def advertiser_authenticate!
    redirect_to new_user_session_path unless advertiser_signed_in?
  end

  def auditor_authenticate!
    redirect_to new_user_session_path unless auditor_signed_in?
  end
end
