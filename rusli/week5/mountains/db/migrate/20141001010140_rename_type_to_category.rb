class RenameTypeToCategory < ActiveRecord::Migration
  def change
  	rename_column :mountains, :type, :category
  end
end
