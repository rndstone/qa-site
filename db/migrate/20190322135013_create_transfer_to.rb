class CreateTransferTo < ActiveRecord::Migration[5.0]
  def change
    create_table :transfer_tos do |t|
      t.references :transfer, foreign_key: true
      t.integer :to 
      
      t.timestamps
    end
  end
end
