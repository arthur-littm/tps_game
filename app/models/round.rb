class Round < ApplicationRecord
  belongs_to :game
  belongs_to :start_up
  has_many :answers
end
