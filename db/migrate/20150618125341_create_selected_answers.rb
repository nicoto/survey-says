class CreateSelectedAnswers < ActiveRecord::Migration
  def change
    create_table :selected_answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
