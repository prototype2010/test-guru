class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy

  belongs_to :category
  belongs_to :rule

  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
end
