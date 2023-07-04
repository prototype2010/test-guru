class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def check_badges_available
    received_badges = Badge.all.select do |badge|
      method_name = badge.circumstance.to_sym
      send("#{method_name}?", badge)
    end

    @test_passage.user.badges << received_badges
    @test_passage.update!(badge_given: true)
  end

  def all_from_category?(badge)
    return false if @test_passage.test.category.id != badge.category_id

    category_tests = @test_passage.test.category.tests.order(:id)
    user_category_passed_tests = TestPassage
                                 .where(user: @test_passage.user,
                                        tests: category_tests)
                                 .order(:test_id)
                                 .select(&:passed?)
                                 .uniq

    category_tests == user_category_passed_tests
  end

  def all_perfectly?(_badge)
    TestPassage.where(user: @test_passage.user).all?(&:perfectly?)
  end

  def tests_passed_3?(_badge)
    TestPassage
      .user_passed_tests(@test_passage.user)
      .count == 5
  end

  def tests_passed_5?(_badge)
    TestPassage
      .user_passed_tests(@test_passage.user)
      .count == 3
  end

  def all_tests_done?(_badge)
    passed_tests_ids = TestPassage
                       .user_passed_tests(@test_passage)
                       .uniq
                       .pluck(:test_id)

    all_tests_ids = Test.all.distinct(:id).order(:id).pluck(:id)
    passed_tests_ids == all_tests_ids
  end

  def all_within_level?(badge)
    completed_tests_ids = @test_passage
                          .user
                          .completed_tests_by_level(badge.level)
                          .order(:id)
                          .select(&:passed?)
                          .uniq

    all_tests_ids = Test.where(level: badge.level).order(:id)

    completed_tests_ids == all_tests_ids
  end
end
