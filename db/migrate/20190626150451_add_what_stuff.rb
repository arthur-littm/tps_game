class AddWhatStuff < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :guess_category, :string
  end
end
