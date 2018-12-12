class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.string :title
      t.string :content
      t.boolean :is_best_answer, default: false

      t.timestamps
    end
  end
end
