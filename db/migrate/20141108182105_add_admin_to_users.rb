class AddAdminToUsers < ActiveRecord::Migration[4.2]
  def change
  	add_column :users, :admin, :boolean
  end
end
