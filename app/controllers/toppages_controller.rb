class ToppagesController < ApplicationController
  def index
    # binding.pry
    # @questions = Question.all
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).limit(10)
  end
  
  def recent
    @recent_questions = Question.limit(10).order('created_at DESC')
  end
  
  def active_question
    @active_questions = Question.where(is_open: true).limit(10)
  end
  
  def categorized_question
    @categorized_question = Question.where(category_id: params[:category_id]).limit(10)
  end
  
  def search
    binding.pry
    @q = Question.ransack(params[:q])
    @found_questions = @q.result(distinct: true)
  end
  
end
