class AddEndTimeToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :end_time, :datetime, null: false, default: Time.now
  end
end
