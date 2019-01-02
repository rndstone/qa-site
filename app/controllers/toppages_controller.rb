class ToppagesController < ApplicationController
  def index
    # binding.pry
    @questions = Question.all
  end
  
  def recent
    @recent_questions = Question.limit(10).order('created_at DESC')
  end
  
  def active_question
    @active_questions = Question.where(is_open: true).limit(10)
  end
end
