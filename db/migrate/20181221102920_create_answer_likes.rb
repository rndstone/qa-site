class CreateAnswerLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_likes do |t|
      t.references :user, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
      t.index [:user_id, :answer_id], unique: true
    end
  end
end
