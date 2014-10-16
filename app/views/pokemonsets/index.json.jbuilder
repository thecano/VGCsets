json.array!(@pokemonsets) do |pokemonset|
  json.extract! pokemonset, :id, :specie, :hp, :atk, :def, :spatk, :spdef, :spd, :item, :nature, :ability, :atk1, :atk2, :atk3, :atk4, :comment
  json.url pokemonset_url(pokemonset, format: :json)
end
