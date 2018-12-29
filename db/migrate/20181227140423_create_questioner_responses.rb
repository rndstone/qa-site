class CreateQuestionerResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :questioner_responses do |t|
      t.references :answer, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
