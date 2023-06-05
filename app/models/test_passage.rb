class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def question_number
    test.questions.order(:id).find_index(current_question) + 1
  end

  def completed?
    return false if new_record?

    current_question.nil? && find_next_question.nil?
  end

  def passed?
    (correct_questions / test.questions.count) >= 0.85
  end

  private

  def find_next_question
    return test.questions.first if new_record?
    return nil unless current_question

    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_question
    return unless test.present?

    self.current_question = find_next_question
  end

  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
