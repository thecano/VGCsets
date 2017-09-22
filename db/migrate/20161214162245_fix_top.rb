class FixTop < ActiveRecord::Migration[4.2]
  def change
  	rename_column :tops, :format, :formato
  end
end
