class Move < ActiveRecord::Base
self.table_name="move_names"
	has_many :pokemonsets
end
