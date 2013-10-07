class AdsController < ApplicationController
  respond_to :html

  inherit_resources
  actions :index, :show, :new, :create

  before_action :advertiser_authenticate!, :only => [:new, :create]
  before_action :auditor_authenticate!,    :only => :destroy

  def index
    @ads = Ad.all if auditor_signed_in?
  end

  def create
    create! { collection_url }
  end

  protected

  def begin_of_association_chain
    current_user
  end

  def permitted_params
    params.permit(resource_instance_name => [:agent, :ad_type, :approved, :agent_phone, :price, :address, :city, :bull1, :bull2, :bull3, :bull4, :sms_code, :when_run])
  end
end
