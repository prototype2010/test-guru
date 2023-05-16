class Result < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :test
end
