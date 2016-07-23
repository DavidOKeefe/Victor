class PlayersController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @players = @game.players
  end

  def new
    @game = Game.find(params[:game_id])
    @player = Player.new
  end

  def create
    player = Player.create(new_player_params)
    redirect_to game_players_path(game_id: params[:game_id])
  end

  def edit
    @game = Game.find(params[:game_id])
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    if player.update_attributes(player_params)
      flash[:notice] = "Player Updated"
      redirect_to game_players_path(game_id: params[:game_id])
    else
      flash[:alert] = "Problem Saving Player"
    end
  end

  private
  def player_params
    params.require(:player).permit(:name)
  end

  def new_player_params
    player_params.merge(game_id: params[:game_id])
  end
end
