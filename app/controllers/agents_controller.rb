class AgentsController < ApplicationController
before_action :require_user_logged_in

  def index
    @agent = Agent.all
  end
  
  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(agent_params)

    if @agent.save
      flash[:success] = 'エージェントを登録しました。'
      redirect_to @agent
    else
      flash.now[:danger] = 'エージェントの登録に失敗しました。'
      render :new
    end
  end
  
  def show
    @agent = Agent.find(params[:id])
    # @agents = @user.agents
    # @projects = @user.projects
  end

  def edit
    @agent = Agent.find(params[:id])
    # @agents = @user.agents
    # @projects = @user.projects
  end

  def update
    @agent = Agent.find(params[:id])
    if @agent.update(update_agent_params)
      flash[:success] = 'エージェント情報が正常に更新されました'
      redirect_to @agent
    else
      flash.now[:danger] = 'エージェント情報が更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @agent = Agent.find(params[:id])
    @agent.destroy
    flash[:success] = 'エージェントを削除しました'
    redirect_to agents_url
  end
  
  def projectlists
    @agent = Agent.find(params[:id])
    @projects = @agent.projects.order("created_at DESC")
  end
   
  private

  def agent_params
    params.require(:agent).permit(:company, :name, :phone, :email, :url)
  end

  def update_agent_params
    params.require(:agent).permit(:company, :name, :phone, :email, :url)
  end
end
