module QuestionsHelper
  def form_header(question)
    "#{question.persisted? ? 'Edit' : 'Create'} new '#{question.test.title}' question"
  end
end
