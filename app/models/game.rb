class Game < ApplicationRecord
  has_many :participants, foreign_key: :user_id, class_name: 'User'
  has_many :rounds
  belongs_to :user, optional: true
  validates :code, presence: true

  attr_accessor :user_name, :rounds
end
