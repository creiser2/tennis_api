class DropAgain < ActiveRecord::Migration[5.2]
  def change
    drop_table :mpbridges
  end
end
