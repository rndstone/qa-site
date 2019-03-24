class CreateCurrencyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :currency_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
