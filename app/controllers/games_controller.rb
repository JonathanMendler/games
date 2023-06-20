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

  def show
    @game = Game.find_by(id: params[:id])
    render :show
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.update(
      manufacturer: params[:manufacturer] || @game.manufacturer,
      console: params[:console] || @game.console,
      price: params[:price] || @game.price,
      storage: params[:storage] || @game.storage,
      description: params[:description] || @game.description,
      image_url: params[:image_url] || @game.image_url,
    )
    render :show
  end
end
