class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy
  belongs_to :category, optional: true

  enum circumstance_variant:
         %i[all_from_category all_perfectly tests_passed_3 tests_passed_5 all_tests_done]

  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :circumstance, inclusion: { in: circumstance_variants.keys.map(&:to_s) }
  validates :category_id, presence: true, if: -> { circumstance == :all_from_category }

  class << self
    def check_badges_available(test_passage)
      received_badges = Badge.all.select do |badge|
        method_name = badge.circumstance.to_sym
        send(method_name, test_passage, badge)
      end

      test_passage.user.badges << received_badges
      test_passage.update(badge_given: true)
    end

    def all_from_category(test_passage, badge)
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

    def all_perfectly(test_passage, _badge)
      TestPassage.where(user: test_passage.user).all?(&:perfectly?)
    end

    def tests_passed_3(test_passage, _badge)
      TestPassage
        .user_passed_tests(test_passage.user)
        .count == 5
    end
    def tests_passed_5(test_passage, _badge)
      TestPassage
        .user_passed_tests(test_passage.user)
        .count == 3
    end

    def all_tests_done(test_passage, _badge)
      passed_tests_ids = TestPassage
                           .user_passed_tests(test_passage)
                           .uniq
                           .pluck(:test_id)

      all_tests_ids = Test.all.distinct(:id).order(:id).pluck(:id)
      passed_tests_ids == all_tests_ids
    end
  end
end
