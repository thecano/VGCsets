class CreatePokemonsets < ActiveRecord::Migration
  def change
    create_table :pokemonsets do |t|
      t.integer :specie
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :spatk
      t.integer :spdef
      t.integer :spd
      t.integer :item
      t.integer :nature
      t.integer :ability
      t.integer :atk1
      t.integer :atk2
      t.integer :atk3
      t.integer :atk4
      t.string :comment

      t.timestamps
    end
  end
end
