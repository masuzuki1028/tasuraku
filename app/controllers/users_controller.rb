class UsersController < ApplicationController
before_action :require_user_logged_in, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    # @agents = @user.agents
    # @agent = Agent.all
    # @projects = @user.projects
  end

  def edit
    @user = User.find(params[:id])
    # @agents = @user.agents
    # @projects = @user.projects
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_user_params)
      flash[:success] = 'ユーザ情報が正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ情報が更新されませんでした'
      render :edit
    end
  end
   
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone)
  end
  
end