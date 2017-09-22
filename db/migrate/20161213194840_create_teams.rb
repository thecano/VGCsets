class CreateTeams < ActiveRecord::Migration[4.2]
  def change
    create_table :teams do |t|
      t.integer :player_id
      t.integer :pokemon1_id
      t.integer :pokemon2_id
      t.integer :pokemon3_id
      t.integer :pokemon4_id
      t.integer :pokemon5_id
      t.integer :pokemon6_id
      t.timestamps
    end
  end
end
