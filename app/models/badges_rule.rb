class BadgesRule < ApplicationRecord
  belongs_to :rule
  belongs_to :badge
end
