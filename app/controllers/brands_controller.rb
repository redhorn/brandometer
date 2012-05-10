class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find_by_uid(params[:id])
  end

  def new
    @brand = Brand.new
  end

  def edit
    @brand = Brand.find_by_uid(params[:id])
  end

  def update
    @brand = Brand.find_by_uid(params[:id])
    if @brand.update_attributes(params[:brand])
      flash[:success] = "Brand updated"
      redirect_to @brand
    else
      render 'edit'
    end
  end

  def create
    params[:brand].delete(:uid) if params[:brand][:uid].empty?

    @brand = Brand.new(params[:brand])
    if @brand.save
      flash[:success] = "Created brand: #{@brand.name}"
      redirect_to @brand
    else
      render 'new'
    end
  end

  def destroy
    brand = Brand.find_by_uid(params[:id]).destroy
    flash[:success] = "Brand '#{brand.name}' destroyed."
    redirect_to brands_path
  end

end
