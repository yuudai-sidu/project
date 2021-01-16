class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end
  
 def create
   @project = Project.new(project_params)
   @project.user_id = current_user.id
   if @project.save
     redirect_to project_path(@project), notice: "投稿できました"
   else
     render :new
   end
 end

  def edit
    @project = Project.find(params[:id])
    if @project.user != current_user
        redirect_to projects_path, alert: "不正なアクセスです。"
    end
  end
  
  def update
    @project = Project.find(params[:id])
   if  @project.update(project_params)
      redirect_to project_path(@project), notice: "更新しました"
   else
     render :edit
   end
  end
  
  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path
  end
  
  private
 
  def project_params
    params.require(:project).permit(:title, :body, :image)
  end
end
