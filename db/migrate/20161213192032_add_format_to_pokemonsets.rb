class AddFormatToPokemonsets < ActiveRecord::Migration[4.2]
  def change
  	add_column :pokemonsets, :format, :string, :default => "VGC15"
  end
end
