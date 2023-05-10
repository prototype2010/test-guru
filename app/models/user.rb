class User < ApplicationRecord

  def tests_by_level(level)
    Test.find_by_sql("
      SELECT title from tests
      JOIN results ON
      results.test_id = tests.id
      AND results.user_id = ?
      AND tests.level = ?", [id, level])
        .pluck('title')
  end
end
