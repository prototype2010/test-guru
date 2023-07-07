module Badges
  class AllPerfectlySpecification < BadgeSpecification
    def satisfied?
      @test_passage.user.test_passages.all?(&:perfectly?)
    end
  end
end
