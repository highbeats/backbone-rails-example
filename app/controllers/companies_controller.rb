class CompaniesController < ApplicationController
  respond_to :json

  def index
    respond_with @companies = Company.all
  end

  def show
    respond_with @company = Company.find(params[:id])
  end

  def new
    respond_with @company = Company.new
  end

  def create
    if @company = Company.create(params[:company])
      respond_with @company
    else
      respond_with @company.errors
    end
  end

  def update
    respond_with @company = Company.update(params[:id], params[:entry])
  end

  def destroy
    respond_with @company = Company.destroy(params[:id])
  end

end
