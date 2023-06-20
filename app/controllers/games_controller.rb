class GamesController < ApplicationController
  def index
    @games = Game.all
    render :index
  end

  def create
    @game = Game.create(
      manufacturer: params[:manufacturer],
      console: params[:console],
      price: params[:price],
      storage: params[:storage],
      description: params[:description],
      image_url: params[:image_url],
    )
    render :show
  end
end
