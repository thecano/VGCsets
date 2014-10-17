class Pokemon < ActiveRecord::Base
	self.table_name="pokemon"
	has_many :pokemonsets
end
