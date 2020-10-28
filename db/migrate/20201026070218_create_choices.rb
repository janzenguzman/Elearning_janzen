class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.references :word, foreign_key: true
      t.string :choice
      t.boolean :is_correct

      t.timestamps
    end
  end
end
