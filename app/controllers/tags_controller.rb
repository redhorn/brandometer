class TagsController < ApplicationController
  include BrandsHelper

  def new
    # Always redirect to a random brand if no id is provided
    if !params[:id]
      redirect_to random_brand_path
      return
    end

    @brand = Brand.find_by_uid(params[:id])
    @tag = Tag.new
  end

  def create
    # Delete tag value if user chose to skip this brand
    params[:tag][:value] = '' if params[:skip]

    @brand = Brand.find(params[:tag].delete(:brand))
    @tag = Tag.find_or_create_by_value(params[:tag][:value].strip)
    TagOccurrence.create(brand: @brand, tag: @tag, user: current_user)

    @next_brand = random_brand

    respond_to do |format|
      format.html { redirect_to random_brand_path }
      format.js
    end
  end

end
