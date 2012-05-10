class StoriesController < ApplicationController
  # GET /projects/:project_id/stories/:id(.:format)
  def show
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @story }
    end
  end

  # GET /projects/:project_id/stories/new(.:format)
  def new
    @project = Project.find(params[:project_id])
    @story = @project.stories.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
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

    respond_to do |format|
      if @story.save
        format.html { redirect_to project_story_url(@project, @story), notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/:project_id/stories/:id(.:format)
  def update
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to project_story_url(@project, @story), notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/:project_id/stories/:id(.:format)
  def destroy
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to project_url(@project), notice: 'Story was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
