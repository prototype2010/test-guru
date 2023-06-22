module TestPassagesHelper
  def test_passage_progress(test_passage)
    question_index = test_passage.question_number - 1
    questions_total = test_passage.test.questions.count

    OpenStruct.new(current: question_index, total: questions_total)
  end
end
