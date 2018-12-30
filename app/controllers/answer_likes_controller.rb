class AnswerLikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    answer = Answer.find(params[:answer_id]) 
    current_user.answer_likes.find_or_create_by(answer_id: answer.id)
    redirect_to answer.question
  end

  def destroy
  end
end
