class Category < ApplicationRecord
  default_scope -> { order(title: :desc) }

  has_many :tests, dependent: :destroy
  has_many :badges, dependent: :nullify

  validates :title, presence: true
end
