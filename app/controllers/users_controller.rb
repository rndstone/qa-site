class UsersController < ApplicationController
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
      redirect_to root
    else
      flash[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def update
  end

  def destroy
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
