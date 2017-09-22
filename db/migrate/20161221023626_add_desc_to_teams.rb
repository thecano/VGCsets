class AddDescToTeams < ActiveRecord::Migration[4.2]
  def change
  	add_column :teams, :desc, :string
  end
end
