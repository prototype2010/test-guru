class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.status == 201
      Gist.create(user: current_user, url: result.data.url, question: @test_passage.current_question)
      redirect_to test_passage_path(@test_passage), { notice: t('.success', url: result.data.url) }
    else
      redirect_to test_passage_path(@test_passage), { notice: t('.failure') }
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
