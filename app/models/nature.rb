class Nature < ActiveRecord::Base
	self.table_name="nature_names"
	has_many :pokemonsets
end
