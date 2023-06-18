class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
    response_params
  end

  private

  def response_params
    response = @client.last_response
    OpenStruct.new(url: response.data.html_url, success?: response.status == 201)
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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end
end
