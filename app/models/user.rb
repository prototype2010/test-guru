class User < ApplicationRecord

  def tests_by_level(level)
    Test.distinct
        .joins(questions: :answers)
        .where('answers.user_id': id, 'tests.level': level)
        .pluck('tests.title')
  end
end
