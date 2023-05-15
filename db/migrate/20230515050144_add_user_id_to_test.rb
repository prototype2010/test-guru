class AddUserIdToTest < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :user, null: false, foreign_key: true
  end
end
