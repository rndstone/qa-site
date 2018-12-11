class QuestionsController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy]
  include SessionsHelper
  
  def new
    unless logged_in?
      flash[:danger] = 'ログインしてください。'
      redirect_to :login
    end
  end

  def create
  end

  def show
  end

  def destroy
  end
end
