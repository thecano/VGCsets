class Pokemonset < ActiveRecord::Base
 acts_as_votable
belongs_to :pokemon, :foreign_key => 'specie'
end
