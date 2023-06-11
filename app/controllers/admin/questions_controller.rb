class Admin::QuestionsController < Admin::BaseController
  before_action :find_question, except: %i[create new]
  before_action :find_test, only: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_test_path(@question.test)
  end

  def new
    @question = @test.questions.build
  end

  def show; end

  def edit; end

  private

  def question_params
    params.require(:question).permit(:body)
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
