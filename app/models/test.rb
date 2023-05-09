class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  class << self
    def by_category_title(category_title)
      joins(:category)
        .where('categories.title': category_title)
        .order('tests.title': :desc)
        .pluck('tests.title')
    end
  end
end
