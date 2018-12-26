class AnswersController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    # binding.pry
    # if current_user.id == @question.user_id
      @answer = current_user.answers.new(answer_params)
      if @answer.save
        flash[:success] = '回答を送信しました'
        redirect_to question_path(params[:answer][:question_id])
      else
        flash.now[:danger] = '回答に失敗しました'
        render question_path(params[:answer][:question_id])
      end
    # end
  end

  def edit
  end

  def destroy
  end
  
  private
  
  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
  
  def questioner_cannot_answer
    if current_user.id == @question.user_id
      redirect_to root_url
    end
  end
end
