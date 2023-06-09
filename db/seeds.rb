user1 = User.new({ first_name: 'My name 1', last_name: 'Last name 1', password: '111111', email: '1@gmail.com',
                   type: 'Admin' })
user1.skip_confirmation!
user1.save!

user2 = User.new({ first_name: 'My name 2', last_name: 'Last name 2', password: '111111', email: '2@gmail.com' })
user2.skip_confirmation!
user2.save!

category1, category2 = Category.create!([
                                          { title: 'Category 1' },
                                          { title: 'Category 2' }
                                        ])

test1, test2, test3, test4, test5 = Test.create!([
                                                   { title: 'test 1', level: 1, category: category1, author: user1 },
                                                   { title: 'test 2', level: 2, category: category2, author: user2 },
                                                   { title: 'test 3', level: 3, category: category2, author: user1 },
                                                   { title: 'test 4', level: 4, category: category1, author: user1 },
                                                   { title: 'test 5', level: 5, category: category1, author: user2 }
                                                 ])

questions = Question.create!([
                               { body: 'Question body 1', test: test1 },
                               { body: 'Question body 2', test: test1 },
                               { body: 'Question body 3', test: test1 },
                               { body: 'Question body 4', test: test1 },
                               { body: 'Question body 5', test: test2 },
                               { body: 'Question body 6', test: test2 },
                               { body: 'Question body 7', test: test2 },
                               { body: 'Question body 8', test: test2 },
                               { body: 'Question body 9', test: test3 },
                               { body: 'Question body 10', test: test3 },
                               { body: 'Question body 11', test: test3 },
                               { body: 'Question body 12', test: test3 },
                               { body: 'Question body 13', test: test4 },
                               { body: 'Question body 14', test: test4 },
                               { body: 'Question body 15', test: test4 },
                               { body: 'Question body 16', test: test4 },
                               { body: 'Question body 17', test: test5 },
                               { body: 'Question body 18', test: test5 },
                               { body: 'Question body 19', test: test5 },
                               { body: 'Question body 20', test: test5 }
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
                 { question: questions[7], correct: false, body: 'answer 4' },

                 { question: questions[8], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[8], correct: false, body: 'answer 2' },
                 { question: questions[8], correct: false, body: 'answer 3' },
                 { question: questions[8], correct: false, body: 'answer 4' },

                 { question: questions[9], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[9], correct: false, body: 'answer 2' },
                 { question: questions[9], correct: false, body: 'answer 3' },
                 { question: questions[9], correct: false, body: 'answer 4' },

                 { question: questions[10], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[10], correct: false, body: 'answer 2' },
                 { question: questions[10], correct: false, body: 'answer 3' },
                 { question: questions[10], correct: false, body: 'answer 4' },

                 { question: questions[11], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[11], correct: false, body: 'answer 2' },
                 { question: questions[11], correct: false, body: 'answer 3' },
                 { question: questions[11], correct: false, body: 'answer 4' },

                 { question: questions[12], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[12], correct: false, body: 'answer 2' },
                 { question: questions[12], correct: false, body: 'answer 3' },
                 { question: questions[12], correct: false, body: 'answer 4' },

                 { question: questions[13], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[13], correct: false, body: 'answer 2' },
                 { question: questions[13], correct: false, body: 'answer 3' },
                 { question: questions[13], correct: false, body: 'answer 4' },

                 { question: questions[14], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[14], correct: false, body: 'answer 2' },
                 { question: questions[14], correct: false, body: 'answer 3' },
                 { question: questions[14], correct: false, body: 'answer 4' },

                 { question: questions[15], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[15], correct: false, body: 'answer 2' },
                 { question: questions[15], correct: false, body: 'answer 3' },
                 { question: questions[15], correct: false, body: 'answer 4' },

                 { question: questions[16], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[16], correct: false, body: 'answer 2' },
                 { question: questions[16], correct: false, body: 'answer 3' },
                 { question: questions[16], correct: false, body: 'answer 4' },

                 { question: questions[17], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[17], correct: false, body: 'answer 2' },
                 { question: questions[17], correct: false, body: 'answer 3' },
                 { question: questions[17], correct: false, body: 'answer 4' },

                 { question: questions[18], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[18], correct: false, body: 'answer 2' },
                 { question: questions[18], correct: false, body: 'answer 3' },
                 { question: questions[18], correct: false, body: 'answer 4' },

                 { question: questions[19], correct: true, body: 'answer 1 (correct)' },
                 { question: questions[19], correct: false, body: 'answer 2' },
                 { question: questions[19], correct: false, body: 'answer 3' },
                 { question: questions[19], correct: false, body: 'answer 4' }
               ])

all_from_category_1 = Rule.create!(circumstance: 'all_within_category',
                                 description: 'All tests are done within category 1',
                                 value: category1.id)


all_from_category_2 = Rule.create!(circumstance: 'all_within_category',
                                 description: 'All tests are done within category 2',
                                 value: category2.id)

all_perfectly = Rule.create!(circumstance: 'all_perfectly',
                             description: 'All tests are finished with 100% correct answers',
                             value: 1)

tests_passed_3 = Rule.create!(circumstance: 'tests_passed_3',
                              description: '3 any tests are passed',
                              value: 3)

tests_passed_5 = Rule.create!(circumstance: 'tests_passed_5',
                              description: '5 any tests are passed',
                              value: 5)

all_within_level_1 = Rule.create!(circumstance: 'all_within_level',
                                description: 'All tests are done within level 1',
                                value: 1)

all_within_level_2 = Rule.create!(circumstance: 'all_within_level',
                                description: 'All tests are done within level 2',
                                value: 2)

Rule.create!(circumstance: 'all_within_level',
                                description: 'All tests are done within level 3',
                                value: 3)

Rule.create!(circumstance: 'all_within_level',
                                description: 'All tests are done within level 4',
                                value: 4)

  Rule.create!(circumstance: 'all_within_level',
                                description: 'All tests are done within level 5',
                                value: 5)

all_tests_done = Rule.create!(circumstance: 'all_tests_done',
                              description: 'All tests are done',
                              value: 1)


Badge.create!(name: 'Category 1 level 1 all done',
              description: 'For all tests done in category 1',
              url: '/images/badge3.jpg',
              rules: [all_from_category_1, all_within_level_1])

Badge.create!(name: 'Category 2 All done',
              description: 'For all tests done in category 2',
              url: '/images/badge4.jpg',
              rules: [all_from_category_2, all_within_level_2])

Badge.create!(name: 'Every test done for 100%',
              description: 'This badge can be received only if every test is passed perfectly(100%)',
              url: '/images/badge1.png',
              rules: [all_perfectly])

Badge.create!(name: 'All within level 1 done',
              description: 'This badge can be received when 3 tests passed ',
              url: '/images/badge2.webp',
              rules: [all_within_level_1])

Badge.create!(name: 'All within level 2 done',
              description: 'This badge can be received when 3 tests passed ',
              url: '/images/badge2.webp',
              rules: [all_within_level_1])

Badge.create!(name: '3 passed tests',
              description: 'This badge can be received when 3 tests passed ',
              url: '/images/badge2.webp',
              rules: [tests_passed_3])

Badge.create!(name: '5 passed tests',
              description: 'This badge can be received when 5 tests passed ',
              url: '/images/badge3.jpeg',
              rules: [tests_passed_5])

Badge.create!(name: 'All tests done',
              description: 'You should complete all tests to receive this badge',
              url: '/images/badge4.jpg',
              rules: [all_tests_done])
