class Pokemon < ActiveRecord::Base
	self.table_name="pokemon_species_names"
	self.primary_key = 'pokemon_species_id'
	scope :english, -> { where(local_language_id: '9') }
end
