module Badges
class NumberOfTestsPassedSpecification < BadgeSpecification
  def satisfied?
    @test_passage.user.test_passages.select(&:perfectly?).count == @rule.value
  end
end
end
