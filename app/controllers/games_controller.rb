class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    game = Game.create(game_params)
    redirect_to game_players_path(game_id: game.id)
  end

  private
  def game_params
    params.require(:game).permit(:name)
  end
end
