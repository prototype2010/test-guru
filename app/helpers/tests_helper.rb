module TestsHelper
  def form_header(test)
    test.persisted? ? "Edit #{test.title}" : 'Create new test'
  end
end
