class Pokemon < ActiveRecord::Base
	self.table_name="pokemon_species_names"
	scope :english, -> { where(local_language_id: '9') }
	has_many :pokemonsets
end
