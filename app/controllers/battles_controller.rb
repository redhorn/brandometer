class BattlesController < ApplicationController

  def new
    # Always redirect to a random brand if no id is provided
    if !params[:brand1] or !params[:brand2]
      brands = Brand.all(order: "RANDOM()", limit: 2)
      redirect_to action: "new", brand1: brands[0].uid, brand2: brands[1].uid
      return
    end

    @battle = Battle.new
    @brand1 = Brand.find_by_uid(params[:brand1])
    @brand2 = Brand.find_by_uid(params[:brand2])
  end

  def create

  end

end
