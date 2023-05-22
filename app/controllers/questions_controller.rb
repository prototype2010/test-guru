class QuestionsController < ApplicationController
  before_action :find_question, except: %i[index create new]
  before_action :find_test, only: %i[create new index]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @questions = @test.questions
  end

  def create
    question = @test.questions.create(body: question_params[:body])

    if question.save
      redirect_to question_path(question)
    else
      render plain: 'Failed to save question', status: 422
    end
  end

  def update
    @question.body = question_params[:body]

    if @question.save
      render :show
    else
      render plain: 'Failed to save entity', status: 422
    end
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path(@question.test)
  end

  def new; end

  def show; end

  def edit; end

  private

  def question_params
    params.require(:question).permit(:body, :id, :test_id)
  end

  def record_not_found
    render plain: 'Entity not found', status: 404
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
