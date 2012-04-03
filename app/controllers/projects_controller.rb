class ProjectsController < ApplicationController
  # GET /projects(.:format)
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/:id(.:format)
  def show
    @project = Project.find(params[:id])
    @active_stories = Story.where("project_id = ? AND category = ?", params[:id], "Active")
    @freezed_stories = Story.where("project_id = ? AND category = ?", params[:id], "Freezed")
    @dropped_stories = Story.where("project_id = ? AND category = ?", params[:id], "Dropped")
    @iterations = @project.iterations.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new(.:format)
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/:id/edit(.:format)
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects(.:format)
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/:id(.:format)
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/:id(.:format)
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
