class FixTop < ActiveRecord::Migration
  def change
  	rename_column :tops, :format, :formato
  end
end
