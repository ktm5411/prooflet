class AdvertisersController < ApplicationController
  respond_to :html

  inherit_resources
  actions :new, :create, :edit

  before_action :auditor_authenticate!

  def create
    create! { ads_path }
  end

  private

  def permitted_params
    params.permit(:advertiser => [:email, :password, :password_confirmation])
  end
end
