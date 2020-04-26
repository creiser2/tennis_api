class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :match, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
