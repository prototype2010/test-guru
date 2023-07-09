module Badges
class BadgeSpecification < Specification
  def initialize(test_passage, rule)
    super()
    @test_passage = test_passage
    @rule = rule
  end
end
end
