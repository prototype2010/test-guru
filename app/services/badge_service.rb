class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def check_badges_available
    received_badges = Badge.all.select do |badge|
      method_name = badge.rule.circumstance.to_sym
      send("#{method_name}?", badge, @test_passage)
    end

    @test_passage.user.badges << received_badges
    @test_passage.update!(badge_given: true)
  end
end
