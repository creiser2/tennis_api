json.extract! tournament, :id, :name, :venue, :winner, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
