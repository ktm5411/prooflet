class AdsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  inherit_resources
  actions :index, :show, :new, :create

  before_action :advertiser_authenticate!, :only => [:new, :create]
  before_action :auditor_authenticate!,    :only => :destroy

  def index
    if advertiser_signed_in?
      @ads = current_user.ads
    else
      @ads = Ad.all
    end
  end

  def new
    @ad = current_user.ads.build :agent => current_user.name, :agent_phone => current_user.phone, :agent_email => current_user.email
    new!
  end

  # public
  def listing
    @ads = Ad.approved.all
  end

  def create
    create! { collection_url }
  end

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @ads ||= end_of_association_chain.order('id desc')
  end

  def permitted_params
    params.permit(resource_instance_name => [:agent, :ad_type, :image_cache, :image, :approved, :agent_phone, :price, :address, :city, :bull1, :bull2, :bull3, :bull4, :sms_code, :when_run, :mls, :agent_email])
  end
end
