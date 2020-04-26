class AddMatchPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :match_players do |t|
      t.belongs_to :match
      t.belongs_to :player
    end
  end
end
