class CoachAssoc < ActiveRecord::Migration[5.2]
  def change
    change_table :coaches do |t|
      t.belongs_to :player
    end
  end
end
