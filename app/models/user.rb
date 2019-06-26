class User < ApplicationRecord
  belongs_to :game, optional: true
  attr_accessor :game_code

  validates :name, presence: true
end
