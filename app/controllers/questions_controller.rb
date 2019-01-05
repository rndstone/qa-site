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
    # ログインしていて、質問投稿ユーザーでない場合はanswer用意
    if logged_in? && @question.user_id != current_user.id
      @answer = current_user.answers.build
    end
  end

  def destroy
  end
  
  def put
    @question = Question.find(params[:id])
    @question.update("is_open = false")
    redirect_to @question
  end
  
  def update
    binding.pry
    @question = Question.find(params[:id])
    # @question.update_attributes 
    @question.is_open = false
    if @question.save
      flash[:success] = "質問の回答を締め切りました"
      redirect_to @question
    else
      flash[:danger] = "失敗しました。"
      redirect_to root_url
    end
  end
  
  private
  
  def question_params
    params.require(:question).permit(:title, :content, :category_id)
  end
end
