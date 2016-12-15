class FixRecurso < ActiveRecord::Migration
  def change
  	 add_column :recursos, :descripcion, :string
  end
end
