class RatingsController < ApplicationController

  def new
    # Always redirect to a random brand if no id is provided
    if !params[:id]
      random_brand_uid = Brand.first(order: "RANDOM()").uid
      redirect_to action: "new", id: random_brand_uid
      return
    end

    @brand = Brand.find_by_uid(params[:id])
    @rating = Rating.new
  end

  def create
    @brand = Brand.find(params[:rating][:brand])
    @rating = Rating.create(brand: @brand, user: current_user, value: params[:rating][:value])

    redirect_to rate_path
  end

end
