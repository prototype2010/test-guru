class Answer < ApplicationRecord
  belongs_to :question

  validates_with AnswerValidators::AnswerMaximumCountValidator, on: :create
  validates_with AnswerValidators::AnswerUpdateValidator, on: :update

  before_destroy :check_remained_answers_count

  scope :correct_only, -> { where(correct: true) }

  private

  def check_remained_answers_count
    throw :abort if question.answers.size - 1 < AnswerValidators::MIN_ANSWERS
  end
end
