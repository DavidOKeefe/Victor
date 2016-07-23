class Player < ActiveRecord::Base
  belongs_to :game
  has_many :scores
  has_many :rounds, through: :scores

  def total_score
    Score.total_score(self)
  end
end
