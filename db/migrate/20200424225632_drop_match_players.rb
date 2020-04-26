class DropMatchPlayers < ActiveRecord::Migration[5.2]
  def change
    drop_table :matchplayers
  end
end
