class AddCreatorToPokemonsets < ActiveRecord::Migration
  def change
  	add_column :pokemonsets, :creator, :integer
  end
end
