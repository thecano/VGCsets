json.array!(@players) do |player|
  json.extract! player, :id, :name, :nickname, :country, :facebook, :twitter, :youtube, :blog
  json.url player_url(player, format: :json)
end
