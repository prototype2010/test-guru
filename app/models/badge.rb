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
        method_name = circumstance_variants.key(badge.circumstance.to_i).to_sym
        send(method_name, test_passage)
      end

      byebug
    end

    def all_from_category(test_passage)
      category_test_ids = test_passage.test.category.tests.pluck(:id).sort
      user_category_tests = TestPassage.where(user: test_passage.user,
                                              test: category_test_ids)
                                        .distinct(:test_id)
                                       .pluck(:test_id)
                                       .sort

      category_test_ids == user_category_tests
    end

    def all_perfectly(test_passage)
      TestPassage.where(user: test_passage.user).all?(&:perfectly?)
    end

    def tests_passed_3(test_passage)
      count_passed_tests(test_passage) == 5
    end
    def tests_passed_5(test_passage)
      count_passed_tests(test_passage) == 5
    end

    def all_tests_done(test_passage)
      passed_tests_ids = TestPassage.where(user: test_passage.user)
                                    .distinct(:test_id)
                                    .select(&:passed?)
                                        .pluck(:test_id)
                                        .sort

      passed_tests_ids = Test.all.pluck(:id)
    end

    private

    def count_passed_tests(test_passage)
      TestPassage
        .where(user: test_passage.user)
        .select(&:passed?)
        .count
    end
  end
end
