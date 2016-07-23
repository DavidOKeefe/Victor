class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    game = Game.create(game_params)
    redirect_to game_players_path(game_id: game.id)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    if game.update_attributes(game_params)
      flash[:notice] = 'Game Updated'
      redirect_to game_players_path(game_id: game.id)
    else
      flash[:notice] = 'Something went wrong'
    end
  end

  private
  def game_params
    params.require(:game).permit(:name)
  end
end
