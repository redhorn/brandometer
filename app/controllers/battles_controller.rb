class BattlesController < ApplicationController

  def new
    # Always redirect to a random brand if no id is provided
    if !params[:brand1] or !params[:brand2]
      redirect_to random_brands
      return
    end

    @battle = Battle.new
    @brand1 = Brand.find_by_uid(params[:brand1])
    @brand2 = Brand.find_by_uid(params[:brand2])
  end

  def create
    @brand1 = Brand.find(params[:battle][:brand1])
    @brand2 = Brand.find(params[:battle][:brand2])
    unless @brand1 == @brand2
      winner = @brand1.id == params[:battle][:winner].to_i ? @brand1 : @brand2
      loser = @brand1 == winner ? @brand2 : @brand1
      @battle = Battle.create(loser: loser.id, winner: winner.id, user: current_user)
    end
    redirect_to random_brands
  end

  private

    def random_brands
      brands = Brand.all(order: "RANDOM()", limit: 2)
      { action: "new", brand1: brands[0].uid, brand2: brands[1].uid }
    end

end
