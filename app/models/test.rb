class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy

  class << self
    def by_category_title(category_title)
      joins(:category)
        .where({ categories: { title: category_title } })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end
