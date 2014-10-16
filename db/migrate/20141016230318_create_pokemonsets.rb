class CreatePokemonsets < ActiveRecord::Migration
  def change
    create_table :pokemonsets do |t|
      t.string :specie
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :spatk
      t.integer :spdef
      t.integer :spd
      t.string :item
      t.string :nature
      t.string :ability
      t.string :atk1
      t.string :atk2
      t.string :atk3
      t.string :atk4
      t.string :comment

      t.timestamps
    end
  end
end
