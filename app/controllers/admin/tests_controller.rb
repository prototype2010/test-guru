class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[edit destroy show update start]
  before_action :set_test, only: %i[new create]

  def index
    @tests = Test.all
  end

  def new; end

  def create
    @test.assign_attributes(test_params)
    @test.author = current_user

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

  def set_test
    @test = Test.new
  end

  def test_params
    params.require(:test).permit(:category_id, :level, :title)
  end
end
