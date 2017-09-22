class AddFechaToTop < ActiveRecord::Migration[4.2]
  def change
    add_column :tops, :fecha, :date
  end
end
