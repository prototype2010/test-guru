class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :completed_by, through: :results, source: :user

  class << self
    def by_category_title(category_title)
      joins(:category)
        .where({ categories: { title: category_title } })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end
