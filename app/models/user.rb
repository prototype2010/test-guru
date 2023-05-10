class User < ApplicationRecord

  def tests_by_level(level)
    Test.joins("
      JOIN results ON
      results.test_id = tests.id
      AND results.user_id = #{id}
      AND tests.level = #{level}")
  end
end
