class Round < ApplicationRecord
  belongs_to :game
  belongs_to :start_up
  has_many :answers
  has_many :votes
  CATEGORIES = ["target", "pain", "solution"]
end
