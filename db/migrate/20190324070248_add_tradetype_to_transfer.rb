class AddTradetypeToTransfer < ActiveRecord::Migration[5.0]
  def change
    add_column :transfers, :tradetype, :Integer
  end
end
