class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy
  belongs_to :category, optional: true

  enum circumstance_variant:
         %i[all_from_category all_perfectly 3_tests_passed 5_tests_passed all_tests_done]

  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :circumstance, inclusion: { in: circumstance_variants.keys.map(&:to_s) }
  validates :category_id, presence: true, if: -> { circumstance == :all_from_category }
end
