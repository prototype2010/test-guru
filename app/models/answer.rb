class Answer < ApplicationRecord
  MAX_ANSWERS = 4
  MIN_ANSWERS = 1

  belongs_to :question

  validate :validate_maximum_answers_count, on: :create
  validate :validate_answers_count, on: :update

  scope :correct, -> { where(correct: true) }

  private

  def validate_maximum_answers_count
    return unless question.answers.count >= MAX_ANSWERS

    errors.add :answer, "Maximum answers count should not be more than #{MAX_ANSWERS}"
  end

  def validate_answers_count
    @original_answer = Answer.find(id)

    return if question_id == @original_answer.question_id

    check_next_question_answers
    answers_count = question.answers.count

    return if answers_count > MIN_ANSWERS && answers_count < MAX_ANSWERS

    answer.errors.add :answer, "Answers count should not be less than #{MAX_ANSWERS}" if answers_count - 1 < MIN_ANSWERS
  end

  def check_next_question_answers
    next_answer_question = Question.find(question_id)
    next_question_answers_count = next_answer_question.answers.count

    return unless next_question_answers_count + 1 > MAX_ANSWERS

    answer.errors.add :answer, "Answer with id #{next_answer_question.id} will have more than #{MAX_ANSWERS} allowed"
  end
end
