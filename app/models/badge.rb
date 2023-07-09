class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy
  has_many :badges_rules
  has_many :rules, through: :badges_rules

  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
end
