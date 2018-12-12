class ToppagesController < ApplicationController
  def index
    # binding.pry
    @questions = Question.all
  end
end
