user1 = User.new({ first_name: 'My name 1', last_name: 'Last name 1', password: '111111', email: "1@gmail.com" })
user1.skip_confirmation!
user1.save!

user2 = User.new({ first_name: 'My name 2', last_name: 'Last name 2',password: '111111', email: "2@gmail.com" })
user2.skip_confirmation!
user2.save!


category1, category2 = Category.create!([
                                          { title: 'Category 1' },
                                          { title: 'Category 2' }
                                        ])

test1, test2 = Test.create!([
                              { title: 'test 1', level: 1, category: category1, author: user1 },
                              { title: 'test 2', level: 2, category: category2, author: user2 }
                            ])

questions = Question.create!([
                               { body: 'Question body 1', test: test1 },
                               { body: 'Question body 2', test: test1 },
                               { body: 'Question body 3', test: test1 },
                               { body: 'Question body 4', test: test1 },
                               { body: 'Question body 5', test: test2 },
                               { body: 'Question body 6', test: test2 },
                               { body: 'Question body 7', test: test2 },
                               { body: 'Question body 8', test: test2 }
                             ])

TestPassage.create!([
                      { user: user1, test: test1, current_question: questions.first, correct_questions: 0 },
                      { user: user2, test: test2, current_question: questions[4], correct_questions: 0 }
                    ])

Answer.create!([
                 { question: questions[0], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[0], correct: false, body: 'answer 2' },
                 { question: questions[0], correct: false, body: 'answer 3' },
                 { question: questions[0], correct: false, body: 'answer 4' },

                 { question: questions[1], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[1], correct: false, body: 'answer 2' },
                 { question: questions[1], correct: false, body: 'answer 3' },
                 { question: questions[1], correct: false, body: 'answer 4' },

                 { question: questions[2], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[2], correct: false, body: 'answer 2' },
                 { question: questions[2], correct: false, body: 'answer 4' },

                 { question: questions[3], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[3], correct: false, body: 'answer 2' },
                 { question: questions[3], correct: false, body: 'answer 4' },

                 { question: questions[4], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[4], correct: false, body: 'answer 2' },
                 { question: questions[4], correct: false, body: 'answer 3' },
                 { question: questions[4], correct: false, body: 'answer 4' },

                 { question: questions[5], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[5], correct: false, body: 'answer 2' },
                 { question: questions[5], correct: false, body: 'answer 3' },
                 { question: questions[5], correct: false, body: 'answer 4' },

                 { question: questions[6], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[6], correct: false, body: 'answer 2' },
                 { question: questions[6], correct: false, body: 'answer 3' },
                 { question: questions[6], correct: false, body: 'answer 4' },

                 { question: questions[7], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[7], correct: false, body: 'answer 2' },
                 { question: questions[7], correct: false, body: 'answer 3' },
                 { question: questions[7], correct: false, body: 'answer 4' }
               ])
