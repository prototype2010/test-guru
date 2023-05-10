# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1, user2 = User.create!([
                      {name: "My name 1", password: rand(10..100), email: "#{rand(50..100)}@gmail.com"},
                      {name: "My name 2", password: rand(10..100), email: "#{rand(1..50)}@gmail.com"},
                    ])

category1, category2 = Category.create!([
                                          {title: 'Category 1'},
                                          {title: 'Category 2'}
                                        ])

test1, test2 = Test.create!([
                              {title: "test 1", level: 0, category_id: category1.id},
                              {title: "test 2", level: 1, category_id: category2.id},
                            ])
question1, question2 = Question.create!([
                   { body: "Question body 1", test_id: test1.id },
                   { body: "Question body 2", test_id: test2.id },
                 ])

Result.create!([
                 {user_id: user1.id, test_id: test1.id, score: "#{rand(1..100)}%"},
                 {user_id: user2.id, test_id: test2.id, score: "#{rand(1..100)}%"},
               ])

Answer.create!([
                 {user_id: user1.id, question_id: question1.id, correct: rand > 0.5 ? true : false},
                 {user_id: user1.id, question_id: question2.id, correct: rand > 0.5 ? true : false},
                 {user_id: user2.id, question_id: question1.id, correct: rand > 0.5 ? true : false},
                 {user_id: user2.id, question_id: question2.id, correct: rand > 0.5 ? true : false},
               ])
