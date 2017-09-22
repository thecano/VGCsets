class FixPokemonset < ActiveRecord::Migration[4.2]
  def change
  rename_column :pokemonsets, :format, :formato
  end
end
