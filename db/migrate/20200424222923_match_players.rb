class MatchPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :matchplayers do |t|
      t.references :match, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true
      t.timestamps
    end
  end
end
