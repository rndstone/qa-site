class RenameTypeColumnToCurrencyType < ActiveRecord::Migration[5.0]
  def change
    rename_column :funds, :type, :currency_type
  end
end
