class Game < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :rounds
  belongs_to :user, optional: true
  validates :code, presence: true

  attr_accessor :user_name

  def scores
    users.map do |user|
      [user.name, user.answers.map { |answer| answer.votes.size }.sum * 100]
    end
  end
end
