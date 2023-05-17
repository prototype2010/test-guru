class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  default_scope -> { order(title: :desc) }

  validates :title, presence: true
end
