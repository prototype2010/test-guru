class AddUserIdToTest < ActiveRecord::Migration[6.1]
  #splitted to separate methods, because 'change' didn't rollback properly
  def up
    add_column :tests, :created_by, :integer
    add_foreign_key :tests, :users, column: 'created_by', foreign_key: true, null: false
  end

  def down
    remove_foreign_key :tests, :users, column: 'created_by'
    remove_column :tests, :created_by
  end
end
