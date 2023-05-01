class CreateAnswers < ActiveRecord::Migration[6.1]
  def up
    create_table :answers do |t|
      t.boolean :is_correct, null: false, default: false
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :answers
  end
end
