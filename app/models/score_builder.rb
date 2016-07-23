class ScoreBuilder
  attr_reader :game, :new_scores

  def self.build(params)
    score_builder = ScoreBuilder.new(params)
    score_builder.create_scores
  end

  def initialize(params)
    @game = Game.find(params[:game_id])
    @new_scores = params[:new_scores]
  end

  def create_scores
    new_scores.each do |new_score|
      player = Player.find(new_score[:player])
      round = Round.find_or_create_by(game: game, number: new_score[:round])
      Score.create(player: player, round: round, scores: new_score[:scores].to_i)
    end
  end
end
