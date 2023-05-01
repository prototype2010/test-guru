class CreateQuestions < ActiveRecord::Migration[6.1]
  def up
    create_table :questions do |t|
      t.string :body, null: false
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end
