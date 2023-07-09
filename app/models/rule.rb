class Rule < ApplicationRecord
  has_many :badges_rules
  has_many :badges, through: :badges_rules

  enum circumstance_variant: %i[
    all_within_category
    all_perfectly
    tests_passed_3
    tests_passed_5
    all_tests_done
    all_within_level
  ]

  validates :description, presence: true
  validates :circumstance, inclusion: { in: circumstance_variants.keys.map(&:to_s) }
  validates :value, numericality: { only_integer: true, greater_than: 0}
end
