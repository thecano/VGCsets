class AddFormatToPokemonsets < ActiveRecord::Migration
  def change
  	add_column :pokemonsets, :format, :string, :default => "VGC15"
  end
end
