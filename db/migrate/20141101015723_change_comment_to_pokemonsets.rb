class ChangeCommentToPokemonsets < ActiveRecord::Migration
  def change
  	change_column :pokemonsets, :comment, :text
  end
end
