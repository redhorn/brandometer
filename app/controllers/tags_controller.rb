class TagsController < ApplicationController

  def show
    # Always redirect to a random brand if no id is provided
    if !params[:id]
      random_brand_uid = Brand.first(order: "RANDOM()").uid
      redirect_to action: "show", id: random_brand_uid
      return
    end

    @brand = Brand.find_by_uid(params[:id])
    @tag = Tag.new
  end

  def create
    @brand = Brand.find(params[:tag].delete(:brand))
    @tag = Tag.find_or_create_by_value(params[:tag][:value].strip)

    TagOccurrence.create(brand: @brand, tag: @tag, user: current_user)

    redirect_to tags_path
  end

end
