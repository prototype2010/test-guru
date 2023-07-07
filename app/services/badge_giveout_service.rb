class BadgeGiveoutService
  RULE_SPECIFICATION_MAPPING = {
    all_within_category: Badges::AllWithinCategorySpecification,
    all_perfectly: Badges::AllPerfectlySpecification,
    tests_passed_3: Badges::NumberOfTestsPassedSpecification,
    tests_passed_5:Badges::NumberOfTestsPassedSpecification,
    all_tests_done: Badges::AllTestsDoneSpecification,
    all_within_level:  Badges::AllWithinLevelSpecification,
  }.freeze


  def initialize(test_passage)
    @test_passage = test_passage
  end

  def give_available_badges
    Badge.find_each do |badge|
      give_badge(badge) if all_rules_satisfied?(badge.rules)
    end
  end

  private

  def all_rules_satisfied?(rules)
    rules.all? do |rule|
      specification_class = RULE_SPECIFICATION_MAPPING[rule.circumstance.to_sym]
      specification_class.new(@test_passage, rule).satisfied?
    end
  end

  def give_badge(badge)
    @test_passage.user.badges << badge
  end
end
