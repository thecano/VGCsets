class FixRecurso < ActiveRecord::Migration[4.2]
  def change
  	 add_column :recursos, :descripcion, :string
  end
end
