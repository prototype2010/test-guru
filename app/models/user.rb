class User < ApplicationRecord

  def tests_by_level(level)
    Test.where("user_id = :id AND level = :level", {id: id, level: level})
  end
end
