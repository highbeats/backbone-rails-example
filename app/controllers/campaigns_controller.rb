class CampaignsController < ApplicationController

  respond_to :json, :html
  before_filter :current_brand, only: :index

  def index
    @campaigns = @brand.present? ? @brand.campaigns : Campaign.all
    respond_with @campaigns
  end

  def show
    respond_with @campaign = Campaign.find(params[:id])
  end

  def create
    if @campaign = Campaign.create(params[:campaign])
      respond_with @campaign
    else
      respond_with @campaign.errors
    end
  end

  def update
    respond_with @campaign = Campaign.update(params[:id], params[:campaign])
  end

  def destroy
    respond_with @campaign = Campaign.destroy(params[:id])
  end

  protected

  def current_brand
    @brand = Brand.find(params[:brand_id]) if params[:brand_id].present?
  end
end
