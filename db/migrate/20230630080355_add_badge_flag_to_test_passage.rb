class AddBadgeFlagToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :badge_given, :boolean, default: false
  end
end
