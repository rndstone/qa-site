class QuestionsController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy]
  include SessionsHelper
  
  def new
    unless logged_in?
      flash[:danger] = 'ログインしてください。'
      redirect_to :login
    end
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = '質問を投稿しました'
      redirect_to root_url
    else
      flash[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
  end
  
  private
  
  def question_params
    params.require(:question).permit(:title, :content, :category_id)
  end
end
