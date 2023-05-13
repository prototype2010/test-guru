class User < ApplicationRecord
  has_many :results
  has_many  :tests, foreign_key: :created_by

  def tests_by_level(level)
    Test.joins(:results)
        .where(results: { user_id: id })
        .where(tests: { level: level })
  end
end
