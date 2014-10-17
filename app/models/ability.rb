class Ability < ActiveRecord::Base
self.table_name="ability_names"
	has_many :pokemonsets
end
