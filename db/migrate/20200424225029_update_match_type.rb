class UpdateMatchType < ActiveRecord::Migration[5.2]
  def change
    rename_column :matches, :type, :matchtype
  end
end
