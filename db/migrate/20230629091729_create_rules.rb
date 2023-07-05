class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.string :circumstance

      t.timestamps
    end
  end
end
