class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :description, null: false
      t.integer :level, null: false
      t.references :category, foreign_key: true, null: false
      t.references :rule, foreign_key: true, null: false

      t.timestamps
    end
  end
end
