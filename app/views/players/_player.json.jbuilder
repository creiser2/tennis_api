json.extract! player, :id, :name, :country, :ranking, :created_at, :updated_at
json.url player_url(player, format: :json)
