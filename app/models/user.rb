class User < ApplicationRecord
  belongs_to :game
  attr_accessor :game_code

end
