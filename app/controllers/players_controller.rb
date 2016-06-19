class PlayersController < ApplicationController

  def index
    @game = Game.find(params['game_id'])
    @players = @game.players
  end
end
