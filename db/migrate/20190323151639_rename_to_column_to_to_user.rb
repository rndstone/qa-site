class RenameToColumnToToUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :transfer_tos, :to, :to_user
  end
end
