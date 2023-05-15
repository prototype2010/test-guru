class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, dependent: :destroy

  def tests_by_level(level)
    test_ids = results.pluck(:test_id)
    tests.where(id: test_ids, level: level)
  end
end
