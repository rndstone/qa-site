class AnswersController < ApplicationController
  before_action :require_user_logged_in
  before_action :questioner_cannot_answer, only:[:create]
  
  def create
    params[:answer][:question_id] = session[:question_id]
    @answer = current_user.answers.new(answer_params)
      if @answer.save
        flash[:success] = '回答を送信しました'
        redirect_to question_path(params[:answer][:question_id])
      else
        flash[:danger] = '回答に失敗しました'
        redirect_to question_path(params[:answer][:question_id])
      end
  end
  
  # def put
  #   @question = Question.find(params[:id])
  #   @question.update("is_open = false")
  #   redirect_to @question
  # end
  
  def update
    # binding.pry
    answer = Answer.find(params[:id])
    # @question.update_attributes 
    answer.is_best_answer = 1
    if answer.save
      flash[:success] = "ベストアンサーに選びました"
      redirect_to Question.find(answer.question_id)
    else
      flash[:danger] = "失敗しました。"
      redirect_to root_url
    end
  end

  def edit
  end

  def destroy
  end
  
  private
  
  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
  
  # 質問者と回答者が同じ場合、回答できないように
  def questioner_cannot_answer
    question = Question.find(session[:question_id])
    if current_user.id == question.user_id
      redirect_to root_url
    end
  end
end
