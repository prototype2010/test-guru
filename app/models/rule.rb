class Rule < ApplicationRecord
  has_many :badges

  enum circumstance_variant: %i[
    all_from_category
    all_perfectly
    tests_passed_3
    tests_passed_5
    all_tests_done
    all_within_level
  ]

  validates :description, presence: true
  validates :circumstance, inclusion: { in: circumstance_variants.keys.map(&:to_s) }

  def all_from_category?(badge, test_passage)
    return false if test_passage.test.category.id != badge.category_id

    category_tests = test_passage.test.category.tests.order(:id)
    user_category_passed_tests = TestPassage
                                 .where(user: test_passage.user,
                                        tests: category_tests)
                                 .order(:test_id)
                                 .select(&:passed?)
                                 .uniq

    category_tests == user_category_passed_tests
  end

  def all_perfectly?(_badge, test_passage)
    TestPassage.where(user: test_passage.user).all?(&:perfectly?)
  end

  def tests_passed_3?(_badge, test_passage)
    TestPassage
      .user_passed_tests(test_passage.user)
      .count == 5
  end

  def tests_passed_5?(_badge, test_passage)
    TestPassage
      .user_passed_tests(test_passage.user)
      .count == 3
  end

  def all_tests_done?(_badge, test_passage)
    passed_tests_ids = TestPassage
                       .user_passed_tests(test_passage)
                       .uniq
                       .pluck(:test_id)

    all_tests_ids = Test.all.distinct(:id).order(:id).pluck(:id)
    passed_tests_ids == all_tests_ids
  end

  def all_within_level?(badge, test_passage)
    completed_tests = TestPassage
                            .where(user: test_passage.user)
                            .order(:id)
                            .select { |passage| passage.test.level == badge.level  }
                            .select(&:passed?)
                            .uniq

    all_level_tests = Test.where(level: badge.level).order(:id)

    completed_tests == all_level_tests
  end
end
