class CreateTops < ActiveRecord::Migration[4.2]
  def change
    create_table :tops do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :team3_id
      t.integer :team4_id
      t.integer :team5_id
      t.integer :team6_id
      t.integer :team7_id
      t.integer :team8_id
      t.string :nombre_torneo
      t.string :tipo_torneo
      t.string :country
      t.timestamps 
      t.string :format
      t.timestamps
    end
  end
end
