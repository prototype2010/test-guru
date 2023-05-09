class RenameIsCorrectAnswerColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :answers, :is_correct, :correct
  end
end
