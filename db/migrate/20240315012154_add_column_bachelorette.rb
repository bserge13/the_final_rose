class AddColumnBachelorette < ActiveRecord::Migration[7.1]
  def change
    add_column :bachelorettes, :season_description, :string 
  end
end
