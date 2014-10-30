json.array!(@pokemonsets) do |pokemonset|
  json.extract! pokemonset, :id, :specie, :hp, :atk, :defe, :spatk, :spdef, :spd, :item, :nature, :ability, :move1, :move2, :move3, :move4, :comment
  json.url pokemonset_url(pokemonset, format: :json)
end
