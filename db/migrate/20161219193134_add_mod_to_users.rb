class AddModToUsers < ActiveRecord::Migration[4.2]
  def change
  	add_column :users, :mod, :boolean, :default => false
  end
end
