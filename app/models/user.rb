class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, dependent: :destroy

  def tests_by_level(level)
    tests.where(id: results, level: level)
  end
end
