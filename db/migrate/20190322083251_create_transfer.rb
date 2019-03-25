class CreateTransfer < ActiveRecord::Migration[5.0]
  def change
    create_table :transfers do |t|
      t.references :user, foreign_key: true
      t.decimal :amount, precision: 14, scale: 5
      
      t.timestamps
    end
  end
end
