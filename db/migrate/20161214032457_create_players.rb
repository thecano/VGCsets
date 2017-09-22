class CreatePlayers < ActiveRecord::Migration[4.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :nickname
      t.string :country
      t.string :facebook
      t.string :twitter
      t.string :youtube
      t.string :blog

      t.timestamps
    end
  end
end
