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
                              {title: "test 1", level: 0, category_id: category1.id, created_by: user1.id},
                              {title: "test 2", level: 1, category_id: category2.id, created_by: user2.id},
                            ])

Result.create!([
                 {user_id: user1.id, test_id: test1.id, score: "#{rand(1..100)}%"},
                 {user_id: user2.id, test_id: test2.id, score: "#{rand(1..100)}%"},
               ])

questions = Question.create!([
                   { body: "Question body 1", test_id: test1.id },
                   { body: "Question body 2", test_id: test1.id },
                   { body: "Question body 3", test_id: test1.id },
                   { body: "Question body 4", test_id: test1.id },
                   { body: "Question body 5", test_id: test2.id },
                   { body: "Question body 6", test_id: test2.id },
                   { body: "Question body 7", test_id: test2.id },
                   { body: "Question body 7", test_id: test2.id },
                 ])

Answer.create!([
                 {question_id: questions[0].id, correct: true, body: 'answer 1'},
                 {question_id: questions[0].id, correct: false, body: 'answer 2'},
                 {question_id: questions[0].id, correct: false, body: 'answer 3'},
                 {question_id: questions[0].id, correct: false, body: 'answer 4'},

                 {question_id: questions[1].id, correct: true, body: 'answer 1'},
                 {question_id: questions[1].id, correct: false, body: 'answer 2'},
                 {question_id: questions[1].id, correct: false, body: 'answer 3'},
                 {question_id: questions[1].id, correct: false, body: 'answer 4'},

                 {question_id: questions[2].id, correct: true, body: 'answer 1'},
                 {question_id: questions[2].id, correct: false, body: 'answer 2'},
                 {question_id: questions[2].id, correct: false, body: 'answer 4'},

                 {question_id: questions[3].id, correct: true, body: 'answer 1'},
                 {question_id: questions[3].id, correct: false, body: 'answer 2'},
                 {question_id: questions[3].id, correct: false, body: 'answer 4'},

                 {question_id: questions[4].id, correct: true, body: 'answer 1'},
                 {question_id: questions[4].id, correct: false, body: 'answer 2'},
                 {question_id: questions[4].id, correct: false, body: 'answer 3'},
                 {question_id: questions[4].id, correct: false, body: 'answer 4'},

                 {question_id: questions[4].id, correct: true, body: 'answer 1'},
                 {question_id: questions[4].id, correct: false, body: 'answer 2'},
                 {question_id: questions[4].id, correct: false, body: 'answer 4'},

                 {question_id: questions[5].id, correct: true, body: 'answer 1'},
                 {question_id: questions[5].id, correct: false, body: 'answer 2'},
                 {question_id: questions[5].id, correct: false, body: 'answer 3'},
                 {question_id: questions[5].id, correct: false, body: 'answer 4'},
               ])
