module Badges
class AllWithinLevelSpecification < BadgeSpecification
  def satisfied?
    rule_level = @rule.value

    return false if rule_level != @test_passage.test.level

    test_ids_by_level = Test.where(level: rule_level).order(:id).pluck(:id)
    user_test_ids_by_level = TestPassage.where(user: @test_passage.user, tests: test_ids_by_level)
                                        .order(:test_id)
                                        .select(&:passed?)
                                        .pluck(:test_id)
                                        .uniq

    test_ids_by_level == user_test_ids_by_level
  end
end
end
