class AddIndexToRuleCircumstance < ActiveRecord::Migration[6.1]
  def change
    add_index :rules, :circumstance, unique: true
  end
end
