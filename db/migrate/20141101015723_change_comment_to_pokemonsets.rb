class ChangeCommentToPokemonsets < ActiveRecord::Migration[4.2]
  def change
  	change_column :pokemonsets, :comment, :text
  end
end
