class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.string :circumstance, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
