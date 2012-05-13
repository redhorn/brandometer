class RatingsController < ApplicationController
  include BrandsHelper

  def new
    # Always redirect to a random brand if no id is provided
    if !params[:id]
      redirect_to random_brand_path
      return
    end

    @brand = Brand.find_by_uid(params[:id])
    @rating = Rating.new
  end

  def create
    @brand = Brand.find(params[:rating][:brand])
    @rating = Rating.create(brand: @brand, user: current_user, value: params[:rating][:value])

    @next_brand = random_brand

    respond_to do |format|
      format.html { redirect_to random_brand_path }
      format.js
    end
  end

end
