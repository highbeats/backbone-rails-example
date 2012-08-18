class BrandsController < ApplicationController
  respond_to :json

  def index
    respond_with @brands = Brand.all
  end

  def show
    respond_with @brand = Brand.find(params[:id])
  end

  def new
    respond_with @brand = Brand.new
  end

  def create
    if @brand = Brand.create(params[:brand])
      respond_with @brand
    else
      respond_with @brand.errors
    end
  end

  def update
    respond_with @brand = Brand.update(params[:id], params[:entry])
  end

  def destroy
    respond_with @brand = Brand.destroy(params[:id])
  end
end
