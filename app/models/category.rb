class Category < ApplicationRecord
  default_scope -> { order(title: :desc) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true
end
