class AddIndexToTestLevelTitle < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, %w[title level], unique: true
  end
end
