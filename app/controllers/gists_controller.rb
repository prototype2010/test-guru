class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(user: current_user, url: result.url, question: @test_passage.current_question)
      redirect_to test_passage_path(@test_passage), { notice: t('.success', url: result.url) }
    else
      redirect_to test_passage_path(@test_passage), { notice: t('.failure') }
    end
  end
end
