class ScorecardsController < ApplicationController
  def create
    @scorecard = ScoreBuilder.build(scorecard_params)
    redirect_to game_scorecard_path
  end

  def show
    @scorecard = Scorecard.build(params[:game_id])
  end

  private
  def scorecard_params
    params.permit(:game_id, :new_scores => [:round, :player, :scores])
  end
end
