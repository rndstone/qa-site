class AddIsBestAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :is_best_answer, :integer, default: 0, null: false
  end
end
