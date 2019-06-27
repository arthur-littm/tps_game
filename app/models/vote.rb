class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :round
  belongs_to :answer

  # validates :user_id, uniqueness: { scope: :round_id }
end
