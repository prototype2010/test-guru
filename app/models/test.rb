class Test < ApplicationRecord

  class << self
    def by_category_title(category_title)
      joins("JOIN categories ON tests.category_id = categories.id")
        .where({ categories: { title: category_title }})
        .order(title: :desc)
        .pluck(:title)
    end
  end
end
