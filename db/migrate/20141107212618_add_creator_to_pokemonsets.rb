class AddCreatorToPokemonsets < ActiveRecord::Migration[4.2]
  def change
  	add_column :pokemonsets, :creator, :integer
  end
end
