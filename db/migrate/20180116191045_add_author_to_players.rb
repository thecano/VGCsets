class AddAuthorToPlayers < ActiveRecord::Migration[5.1]
  def change
  	  	add_column :players, :author, :integer
  end
end
