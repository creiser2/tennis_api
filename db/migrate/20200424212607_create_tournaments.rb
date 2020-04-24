class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :venue
      t.integer :winner

      t.timestamps
    end
  end
end
