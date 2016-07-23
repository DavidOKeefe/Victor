class Score < ActiveRecord::Base
  belongs_to :round
  belongs_to :player

  def self.total_score(player)
    where(player: player).inject(0) { |sum, score| sum + score.scores }
  end
end
