class AddFechaToTop < ActiveRecord::Migration
  def change
    add_column :tops, :fecha, :date
  end
end
