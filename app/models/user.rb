class User < ApplicationRecord
  belongs_to :game

  validates :name, presence: true
end
