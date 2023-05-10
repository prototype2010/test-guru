class Test < ApplicationRecord

  class << self
    def by_category_title(category_title)
      Test.find_by_sql('
      SELECT tests.title as tests_title FROM tests
      JOIN categories ON tests.category_id = categories.id
      AND categories.title = ?
      ORDER BY tests_title DESC', [category_title])
          .pluck('tests_title')
    end
  end
end
