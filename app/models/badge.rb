class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy
  belongs_to :category, optional: true

  enum circumstance_variant:
         %i[all_from_category all_perfectly tests_passed_3 tests_passed_5 all_tests_done all_within_level]

  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :circumstance, inclusion: { in: circumstance_variants.keys.map(&:to_s) }
  validates :category_id, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
end
