class StockImagesController < ApplicationController
  
  before_action :get_stock_image, only: [:show, :update, :destroy]

  # GET /stock_images/1
  def show
    render json: @stock_image
  end

  # POST /stock_images
  def create
    @stock_image = StockImage.new(stock_image_params)

    if @stock_image.save
      render json: @stock_image, status: :created, location: @stock_image
    else
      render json: @stock_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stock_images/1
  def destroy
    @stock_image.destroy
  end

  private
  
  def get_stock_image
    @stock_image = StockImage.find(params[:id])
  end

  def stock_image_params
    params.require(:stock_image).permit(:identifier, :title, :image)
  end
  
end
