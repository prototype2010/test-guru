module Badges
  class AllWithinCategorySpecification < BadgeSpecification
    def satisfied?
      category = Category.find(@rule.value)

      return false if category != @test_passage.test.category

      category_test_ids = category.tests.order(:id).pluck(:id)
      user_category_passed_tests = TestPassage
                                     .where(user: @test_passage.user,
                                            tests: category_test_ids)
                                     .order(:test_id)
                                     .select(&:passed?)
                                     .pluck(:test_id)
                                     .uniq

      user_category_passed_tests == category_test_ids
    end
  end
end
