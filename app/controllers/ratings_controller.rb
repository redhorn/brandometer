class RatingsController < ApplicationController

  def new
    # Always redirect to a random brand if no id is provided
    if !params[:id]
      redirect_to random_brand
      return
    end

    @brand = Brand.find_by_uid(params[:id])
    @rating = Rating.new
  end

  def create
    @brand = Brand.find(params[:rating][:brand])
    @rating = Rating.create(brand: @brand, user: current_user, value: params[:rating][:value])

    redirect_to random_brand
  end

  private

    def random_brand
      random_brand_uid = Brand.first(order: "RANDOM()").uid
      { action: "new", id: random_brand_uid }
    end

end
