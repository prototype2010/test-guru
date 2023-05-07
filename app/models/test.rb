class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  scope :by_category_title, ->(category_title) do
    Test.where(category_id: Category.where("title = :title", title: category_title))
  end
end
