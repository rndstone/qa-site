class AddCurrencyTypeToTransfer < ActiveRecord::Migration[5.0]
  def change
    add_reference :transfers, :currency_type, foreign_key: true
  end
end
