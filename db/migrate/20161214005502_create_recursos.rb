class CreateRecursos < ActiveRecord::Migration[4.2]
  def change
    create_table :recursos do |t|
 	  t.integer :team_id
      t.string :url
      t.timestamps
    end
  end
end
