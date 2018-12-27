class Admin::ProjectsController < ApplicationController
  before_action :authentication_as_admin_required
  layout "admin"

  def index
    if current_user.is_admin?
      @projects = Project.all
    else
      redirect_to root_path
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    redirect_to admin_project_path(@project)
  end

  def show
    @project = Project.find(params[:id])
    @users = @project.users

    if !params[:filter_user_id].blank?
      @tasks = Task.where(user_id: params[:filter_user_id], project_id: params[:id])
    else
      @tasks = @project.tasks.all
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to admin_project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.all_project_tasks.destroy_all
    @project.destroy

    redirect_to admin_projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, user_ids:[])
  end
end
