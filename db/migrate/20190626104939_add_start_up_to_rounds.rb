class AddStartUpToRounds < ActiveRecord::Migration[5.2]
  def change
    add_reference :rounds, :start_up, foreign_key: true
  end
end
