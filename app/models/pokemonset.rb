class Pokemonset < ActiveRecord::Base

belongs_to :pokemon, :foreign_key => 'specie'
end
