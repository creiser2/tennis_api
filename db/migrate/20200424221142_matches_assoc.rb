class MatchesAssoc < ActiveRecord::Migration[5.2]
  def change
    change_table :matches do |t|
      t.belongs_to :tournament
    end
  end
end
