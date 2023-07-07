module Badges
  class AllTestsDoneSpecification < BadgeSpecification
    def satisfied?
      completed_tests = TestPassage
                          .where(user: @test_passage.user)
                          .order(:test_id)
                          .select(&:passed?)
                          .pluck(:test_id)
                          .uniq

      all_tests = Test.all.order(:id).pluck(:id)

      completed_tests == all_tests
    end
  end
end


