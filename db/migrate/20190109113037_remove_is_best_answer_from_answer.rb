class RemoveIsBestAnswerFromAnswer < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :is_best_answer, :boolean
  end
end
