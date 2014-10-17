class Pokemon < ActiveRecord::Base
	self.table_name="pokemon_species_names"
	has_many :pokemonsets
end
