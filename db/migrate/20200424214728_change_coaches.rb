class ChangeCoaches < ActiveRecord::Migration[5.2]
  def change
    change_table :coaches do |t|
       t.integer :age
       t.string :country
    end
  end
end
