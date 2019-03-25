class CreateFunds < ActiveRecord::Migration[5.0]
  def change
    create_table :funds do |t|
      t.decimal :amount, precision: 14, scale: 5, default:0
      t.references :user, foreign_key: true
      t.integer :type
      
      t.timestamps
    end
  end
end
