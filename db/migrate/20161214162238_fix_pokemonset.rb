class FixPokemonset < ActiveRecord::Migration
  def change
  rename_column :pokemonsets, :format, :formato
  end
end
