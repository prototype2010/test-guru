class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :completed_by, through: :test_passages, source: :user

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :level, uniqueness: { scope: :title,  message: 'Test with same title and level already exists' }
  validates :time_limit, numericality: {only_integer: true, greater_than: 0}

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  class << self
    def by_category_title(category_title)
      joins(:category)
        .where({ categories: { title: category_title } })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end
