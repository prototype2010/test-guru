class CreateBadgesRules < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_rules do |t|
      t.references :rule, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
