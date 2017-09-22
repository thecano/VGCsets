class AddBannedToUsers < ActiveRecord::Migration[4.2]
  def change
  	add_column :users, :banned, :boolean
  end
end
