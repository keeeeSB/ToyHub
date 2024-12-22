class ReviewsController < ApplicationController
  before_action :set_toy
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    @review = current_user.build_review(review_params.merge(toy: @toy))
    if @review.save
      flash[:success] = "レビューを投稿しました。"
    else
      flash[:danger] = "レビューを投稿できませんでした。"
    end
    redirect_to toy_path(@toy)
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:success] = "レビューを更新しました。"
      redirect_to toy_path(@toy)
    else
      flash.now[:danger] = "レビューを更新できませんでした。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy!
    flash[:success] = "レビューを削除しました。"
    redirect_to toy_path(@toy)
  end

  private

    def review_params
      params.require(:review).permit(:comment, :rating)
    end

    def set_toy
      @toy = Toy.find(params[:id])
    end

    def set_review
      @review = Review.find_by(user: current_user, toy: @toy)
    end
end
