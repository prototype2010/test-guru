module TestsHelper
  def form_test_header(test)
    test.persisted? ? "Edit #{test.title}" : 'Create new test'
  end
end
