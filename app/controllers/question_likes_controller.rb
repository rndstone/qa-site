class QuestionLikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    question = Question.find(params[:question_id]) 
    current_user.question_likes.find_or_create_by(question_id: question.id)
    redirect_to question
  end

  def destroy
  end
end
