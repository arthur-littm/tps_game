class Game < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :rounds
  belongs_to :user, optional: true
  validates :code, presence: true

  attr_accessor :user_name
end
