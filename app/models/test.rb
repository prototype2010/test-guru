class Test < ApplicationRecord

  class << self
    def by_category_title(category_title)
      Test.joins("
        JOIN categories ON tests.category_id = categories.id
        AND categories.title = '#{category_title}'")
          .order('tests.title': :desc)
    end
  end
end
