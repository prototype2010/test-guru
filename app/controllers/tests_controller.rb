class TestsController < ApplicationController
  before_action :find_test, only: %i[edit destroy show update]

  def index; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      render :show
    else
      render :new
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

    render 'index'
  end

  def edit; end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :level, :title, :author_id)
  end
end
