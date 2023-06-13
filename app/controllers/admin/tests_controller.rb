class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[edit destroy show update start]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.build(test_params)

    if @test.save
      render :show
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      render :show
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def edit; end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :level, :title)
  end
end
