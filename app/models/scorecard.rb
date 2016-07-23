class Scorecard
  attr_reader :game, :players, :rounds, :totals
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
    @new_scores = []
  end

  def next_round
    rounds.size + 1
  end

  def generate_new_scores
    players.each do |player|
      new_scores << Score.new(player: player)
    end
  end
end
