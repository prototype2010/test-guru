class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]
  before_create :set_end_time

  class << self
    def user_passed_tests(user)
      where(user:)
        .order(:test_id)
        .select(&:passed?)
    end
  end

  def accept!(answer_ids)
    return if out_of_time?

    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def question_number
    test.questions.order(:id).find_index(current_question) + 1
  end

  def completed?
    return false if new_record?
    return true if out_of_time?

    current_question.nil? && find_next_question.nil?
  end

  def passed?
    (correct_questions / test.questions.count) >= SUCCESS_RATIO
  end

  def perfectly?
    correct_questions == test.questions.count
  end

  private

  def out_of_time?
    end_time < Time.now
  end

  def set_end_time
    self.end_time = Time.now + test.time_limit.minutes
  end

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
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
