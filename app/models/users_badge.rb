class UsersBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badges_badge, :class_name => 'Badges::Badge'
end
