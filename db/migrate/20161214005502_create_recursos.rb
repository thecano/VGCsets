class CreateRecursos < ActiveRecord::Migration
  def change
    create_table :recursos do |t|
 	  t.integer :team_id
      t.string :url
      t.timestamps
    end
  end
end
