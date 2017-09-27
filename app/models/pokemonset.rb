class Pokemonset < ActiveRecord::Base
 validates :ability, :presence => { :message => ": Se debe ingresar una habilidad" }
 validates :item, :presence => { :message => ": Se debe ingresar un item" }
 validates :nature, :presence => { :message => ": Se debe ingresar una naturaleza" }
 validates :specie, :presence => { :message => ": Se debe ingresar una especie" }
 validates :move1, :presence => { :message => ": Se debe ingresar por lo menos un movimiento" }
 validates :hp, numericality: { only_integer: true, :less_than_or_equal_to => 255 }, allow_nil: true
 validates :atk, numericality: { only_integer: true, :less_than_or_equal_to => 255 }, allow_nil: true
 validates :defe, numericality: { only_integer: true, :less_than_or_equal_to => 255 }, allow_nil: true
 validates :spatk, numericality: { only_integer: true, :less_than_or_equal_to => 255 }, allow_nil: true
 validates :spdef, numericality: { only_integer: true ,:less_than_or_equal_to => 255 }, allow_nil: true
 validates :spd, numericality: { only_integer: true, :less_than_or_equal_to => 255 }, allow_nil: true
 validate :EV_sum

 def EV_sum
 	count=0
 	if not hp.nil?
 		count=count+hp
 	end
 	if not atk.nil?
 		count=count+atk
 	end
 	if not defe.nil?
 		count=count+defe
 	end
 	if not spatk.nil?
 		count=count+spatk
 	end
 	if not spdef.nil?
 		count=count+spdef
 	end
 	if not spd.nil?
 		count=count+spd
 	end
    if count > 510
      errors.add("EV", ": Los EVs no pueden sumar mas de 510")
    end
 end
belongs_to :pokemon, foreign_key: "specie"
end
