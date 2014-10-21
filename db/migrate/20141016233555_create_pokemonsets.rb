class CreatePokemonsets < ActiveRecord::Migration
  def change
    create_table :pokemonsets do |t|
      t.string :title
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
      t.integer :move1
      t.integer :move2
      t.integer :move3
      t.integer :move4
      t.string :comment
      t.boolean :active

      t.timestamps
    end
  end
end
