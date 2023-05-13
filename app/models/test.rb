class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  belongs_to :user, foreign_key: :created_by

  class << self
    def by_category_title(category_title)
      joins(:category)
        .where({ categories: { title: category_title }})
        .order(title: :desc)
        .pluck(:title)
    end
  end
end
