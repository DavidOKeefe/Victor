class Scorecard
  include ActiveModel::Model

  attr_reader :game, :players, :rounds, :totals, :next_round
  attr_accessor :new_scores

  def self.build(params)
    scorecard = new(params)
    scorecard.calculate_totals
    scorecard.generate_new_scores
    scorecard
  end

  def initialize(game_id)
    @game = Game.find(game_id)
    @players = game.players
    @rounds = game.rounds.order(:number)
    @next_round = @rounds.size + 1
    @totals = {}
    @new_scores = []
  end

  def calculate_totals
    players.each do |player|
      totals[player.name] = player.scores.inject(0) { |sum, score| sum + score.scores }
    end
  end

  def generate_new_scores
    players.each do |player|
      new_scores << Score.new(player: player)
    end
  end
end



