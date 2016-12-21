class AddDescToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :desc, :string
  end
end
