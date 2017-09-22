class AddLangToSet < ActiveRecord::Migration[4.2]
  def change
  	add_column :pokemonsets, :lang, :integer, :default => 1
  end
end
