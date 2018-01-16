class AddAuthorToTops < ActiveRecord::Migration[5.1]
  def change
  	add_column :tops, :author, :integer
  end
end
