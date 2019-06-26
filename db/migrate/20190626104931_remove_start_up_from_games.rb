class RemoveStartUpFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :start_up_id
  end
end
