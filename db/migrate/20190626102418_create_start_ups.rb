class CreateStartUps < ActiveRecord::Migration[5.2]
  def change
    create_table :start_ups do |t|
      t.string :pain
      t.string :target
      t.string :solution

      t.timestamps
    end
  end
end
