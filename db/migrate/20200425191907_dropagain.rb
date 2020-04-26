class Dropagain < ActiveRecord::Migration[5.2]
  def change
    drop_table :matches_players 
  end
end
