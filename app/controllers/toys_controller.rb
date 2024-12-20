class ToysController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_toy, only: [:show, :edit, :update, :destroy]

  def index
    @toys = Toy.all
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    if @toy.save
      flash[:success] = "おもちゃを登録しました。"
      redirect_to @toy
    else
      flash.now[:danger] = "おもちゃを登録できませんでした。"
      render :new, status: :umprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @toy.update(toy_params)
      flash[:success] = "おもちゃ情報を更新しました。"
      redirect_to @toy
    else
      flash.now[:danger] = "おもちゃ情報を更新できませんでした。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @toy.destroy!
    flash[:success] = "おもちゃを削除しました。"
    redirect_to toys_path, status: :see_other
  end

  private

    def toy_params
      params.require(:toy).permit(:name, :description, :price)
    end

    def set_toy
      @toy = Toy.find(params[:id])
    end
end
