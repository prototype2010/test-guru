class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :completed_tests, through: :results, source: :test, dependent: :destroy

  validates :email, presence: true

  def completed_tests_by_level(level)
    completed_tests.where(level: level)
  end
end
