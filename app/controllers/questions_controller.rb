class QuestionsController < ApplicationController
  before_action :find_question, except: %i[index create new]
  before_action :find_test, only: %i[create new index]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def create
    @question = Question.create!(test: @test, body: params[:question][:body])
    redirect_to question_path(@question)
  end

  def index
    @questions = @test.questions
  end

  def update
    @question.body = params[:question][:body]
    @question.save!

    render :show
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path(@question.test)
  end

  def new; end

  def show; end

  def edit; end

  private

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
