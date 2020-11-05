class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.belongs_to :word
      t.integer :choice_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
