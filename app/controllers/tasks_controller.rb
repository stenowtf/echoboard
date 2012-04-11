class TasksController < ApplicationController
  # GET /projects/:project_id/stories/:story_id/tasks/:id(.:format)
  def show
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:story_id])
    @task = @story.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /projects/:project_id/stories/:story_id/tasks/new(.:format))
  def new
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:story_id])
    @task = @story.tasks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /projects/:project_id/stories/:story_id/tasks/:id/edit(.:format)
  def edit
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:story_id])
    @task = @story.tasks.find(params[:id])
  end

  # POST /projects/:project_id/stories/:story_id/tasks(.:format)
  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:story_id])
    @task = @story.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_story_url(@project, @story), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/:project_id/stories/:story_id/tasks/:id(.:format)
  def update
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:story_id])
    @task = @story.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to project_story_url(@project, @story), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/:project_id/stories/:story_id/tasks/:id(.:format)
  def destroy
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:story_id])
    @task = @story.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_story_url(@project, @story), notice: 'Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
