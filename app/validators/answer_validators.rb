module AnswerValidators
  MAX_ANSWERS = 4
  MIN_ANSWERS = 1

  class AnswerMaximumCountValidator < ActiveModel::Validator
    def validate(answer)
      if answer.question.answers.size >= MAX_ANSWERS
        answer.errors.add :answer, "Maximum answers count should not be more than #{MAX_ANSWERS}"
      end
    end
  end

  class AnswerUpdateValidator < ActiveModel::Validator
    def validate(answer)
      @original_answer = Answer.find(answer.id)

      return if answer.question_id == @original_answer.question_id

      check_next_question_answers(answer)
      answers_count = answer.question.answers.size

      return if answers_count > MIN_ANSWERS && answers_count < MAX_ANSWERS

      keep_minimum_answers_count(answer) if answers_count - 1 < MIN_ANSWERS
    end

    private

    def keep_minimum_answers_count(answer)
      answer.errors.add :answer, "Answers count should not be less than #{MIN_ANSWERS}"
    end

    def check_next_question_answers(answer)
      next_answer_question = Question.find(answer.question_id)
      next_question_answers_size = next_answer_question.answers.size

      if next_question_answers_size + 1 > MAX_ANSWERS
        answer.errors.add :answer, "Answer with id #{next_answer_question.id} will have more than #{MAX_ANSWERS} allowed"
      end
    end
  end
end
