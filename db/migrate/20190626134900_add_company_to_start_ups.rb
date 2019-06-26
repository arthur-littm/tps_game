class AddCompanyToStartUps < ActiveRecord::Migration[5.2]
  def change
    add_column :start_ups, :company, :string
  end
end
