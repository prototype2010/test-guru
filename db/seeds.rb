# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |category_number|
  category = Category.create!(title: "Category #{category_number}")

  5.times do |test_number|
    test = Test.create!(title: "test number #{test_number}", level: test_number, category_id: category.id)

    5.times do |question_number|
      Question.create!(body: "Question body #{question_number}", test_id: test.id)
    end
  end
end

5.times do |user_number|
  User.create!(name: "Name #{user_number}",
               password: rand(10..100),
               email: "#{rand(10..100)}@gmail.com")
end

Question.all.each  do |question|
  User.all.each do |user|
    Answer.create!(user_id: user.id, question_id: question.id, correct: rand > 0.5 ? true : false)
  end
end

