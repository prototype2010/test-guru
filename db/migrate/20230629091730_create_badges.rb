class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :description, null: false
      t.string :circumstance, null: false
      t.references :category, foreign_key: true, null: true

      t.timestamps
    end
  end
end
