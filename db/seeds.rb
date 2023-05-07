# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |category_number|
  category = Category.create(title: "Category #{category_number}")
  user = User.create(name: "Name #{category_number}", password: rand(100..1000), email: "#{rand(100..1000)}@gmail.com")

  5.times do |test_number|
    test = Test.create(title: "test #{test_number}", level: rand(1..5), category_id: category.id, user_id: user.id)

    10.times do |question_number|
      question = Question.create(body: "question body #{question_number}", test_id: test.id)
      Answer.create(is_correct: true, question_id: question.id)
    end
  end
end
