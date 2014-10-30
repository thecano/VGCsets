class AddCachedVotesToPokemonsets < ActiveRecord::Migration
  def change
  	add_column :pokemonsets, :cached_votes_total, :integer, :default => 0
    add_column :pokemonsets, :cached_votes_score, :integer, :default => 0
    add_column :pokemonsets, :cached_votes_up, :integer, :default => 0
    add_column :pokemonsets, :cached_votes_down, :integer, :default => 0
    add_column :pokemonsets, :cached_weighted_score, :integer, :default => 0
    add_column :pokemonsets, :cached_weighted_total, :integer, :default => 0
    add_column :pokemonsets, :cached_weighted_average, :float, :default => 0.0
    add_index  :pokemonsets, :cached_votes_total
    add_index  :pokemonsets, :cached_votes_score
    add_index  :pokemonsets, :cached_votes_up
    add_index  :pokemonsets, :cached_votes_down
    add_index  :pokemonsets, :cached_weighted_score
    add_index  :pokemonsets, :cached_weighted_total
    add_index  :pokemonsets, :cached_weighted_average
  end
end
