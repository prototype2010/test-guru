class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :completed_tests, through: :test_passages, source: :test, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  def completed_tests_by_level(level)
    completed_tests.where(level: level)
  end

  def test_passage(test)
    test_passages
      .order(id: :desc)
      .find_by(test_id: test.id)
  end
end
