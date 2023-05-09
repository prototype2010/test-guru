class RemoveUserIdFromTests < ActiveRecord::Migration[6.1]
  def change
    remove_reference :tests, :user
  end
end
