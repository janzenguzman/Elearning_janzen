class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.boolean :is_completed, default: false
      t.integer :result

      t.timestamps
    end
  end
end
