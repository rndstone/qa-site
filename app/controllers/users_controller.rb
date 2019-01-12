class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :update, :edit, :destroy]
  before_action :correct_user, only: [:show, :update, :edit, :destroy]
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザー登録に成功しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 更新に成功したときの処理
      flash[:success] = '更新に成功しました'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
  end
  
  def questions
    @questions = current_user.questions.page(params[:page]).per(10)
  end
  
  def answers
    @answers = current_user.answers.page(params[:page]).per(10)
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    if current_user.id != params[:id].to_i
      redirect_to root_url
    end
  end
end
