class AddTimeLimitToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_limit, :integer, null: false, default: 3
  end
end
