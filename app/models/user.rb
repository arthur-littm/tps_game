class User < ApplicationRecord
  belongs_to :game, optional: true
  has_many :answers
  attr_accessor :game_code

  validates :name, presence: true
end
