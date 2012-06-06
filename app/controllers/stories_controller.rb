class StoriesController < ApplicationController
  # GET /projects/:project_id/stories/:id(.:format)
  def show
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])
  end

  # GET /projects/:project_id/stories/new(.:format)
  def new
    @project = Project.find(params[:project_id])
    @story = @project.stories.new
  end

  # GET /projects/:project_id/stories/:id/edit(.:format)
  def edit
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])
  end

  # POST /projects/:project_id/stories(.:format)
  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.new(params[:story])

    if @story.save
      redirect_to project_url(@project), notice: 'Story was successfully created.'
    else
      render :new
    end
  end

  # PUT /projects/:project_id/stories/:id(.:format)
  def update
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to project_story_url(@project), notice: 'Story was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/:project_id/stories/:id(.:format)
  def destroy
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])
    @story.destroy

    redirect_to project_url(@project), notice: 'Story was successfully deleted.'
  end
end
