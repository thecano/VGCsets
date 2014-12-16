class AddLangToSet < ActiveRecord::Migration
  def change
  	add_column :pokemonsets, :lang, :integer, :default => 1
  end
end
