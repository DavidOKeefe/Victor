class Player < ActiveRecord::Base
  belongs_to :game
  has_many :scores
  has_many :rounds, through: :scores
end
