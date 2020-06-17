class ProjectsController < ApplicationController
before_action :require_user_logged_in

  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = '案件を登録しました。'
      redirect_to @project
    else
      flash.now[:danger] = '案件の登録に失敗しました。'
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(update_project_params)
      flash[:success] = 'エージェント情報が正常に更新されました'
      redirect_to @project
    else
      flash.now[:danger] = 'エージェント情報が更新されませんでした'
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = 'エージェントを削除しました'
    redirect_to projects_url
  end
  
  private

  def project_params
    params.require(:project).permit(:agent_id, :title, :content, :status, :schedule)
  end
  
  def update_project_params
    params.require(:project).permit(:agent_id, :title, :content, :status, :schedule)
  end
end
