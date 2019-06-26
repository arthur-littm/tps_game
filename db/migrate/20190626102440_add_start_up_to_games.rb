class AddStartUpToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :start_up, foreign_key: true
  end
end
