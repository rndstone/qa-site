class QuestionerResponsesController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    # binding.pry
    @answer = Answer.find(params[:answer_id])
    session[:answer_id] = params[:answer_id]
    @questioner_response = QuestionerResponse.new
  end

  def create
    # binding.pry
    params[:questioner_response][:answer_id] = session[:answer_id]
    # p params
    questioner_response_params[:answer_id] = session[:answer_id]
    @questioner_response = QuestionerResponse.new(questioner_response_params)
    if @questioner_response.save
      flash[:success] = "返信に成功しました。"
      redirect_to Question.find_by(answer_id: session[:answer_id])
    else
      flash.now[:danger] = "返信に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def destroy
  end
  
  private
  
  def questioner_response_params
    params.require(:questioner_response).permit(:content, :answer_id)
  end
end
