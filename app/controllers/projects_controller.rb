class ProjectsController < ApplicationController
  # GET /projects(.:format)
  def index
    @projects = Project.all
  end

  # GET /projects/:id(.:format)
  def show
    @project = Project.find(params[:id])
    @active_stories = Story.where("project_id = ? AND category = ?", params[:id], "Active")
    @freezed_stories = Story.where("project_id = ? AND category = ?", params[:id], "Freezed")
    @dropped_stories = Story.where("project_id = ? AND category = ?", params[:id], "Dropped")
    @iterations = @project.iterations.order("id")
  end

  # GET /projects/new(.:format)
  def new
    @project = Project.new
  end

  # POST /projects(.:format)
  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new
    end
  end

  # GET /projects/:id/edit(.:format)
  def edit
    @project = Project.find(params[:id])
  end

  # PUT /projects/:id(.:format)
  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /projects/:id(.:format)
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_url, notice: "Project was successfully deleted."
  end
end
