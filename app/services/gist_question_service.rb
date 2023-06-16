class GistQuestionService
  def initialize(question, client: GithubClient.new)
    @question = question
    @test = @question.test
    @client =  client
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_params
    {
      description: "Question about #{@test.title}",
      files: {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join('\n')
  end
end
