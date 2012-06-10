class IterationsController < ApplicationController
  # GET /projects/:project_id/iterations/:id(.:format)
  def show
    @project = Project.find(params[:project_id])
    @iterations = @project.iterations
    @iteration = @project.iterations.find(params[:id])
    @stories_in_iteration = @iteration.stories_in_iterations
  end

  # GET /projects/:project_id/iterations/new(.:format)
  def new
    @project = Project.find(params[:project_id])
    @iterations = @project.iterations
    @last_iteration = @project.iterations.last
    @iteration = @project.iterations.new
  end

  # GET /projects/:project_id/iterations/:id/edit(.:format)
  def edit
    @project = Project.find(params[:project_id])
    @iterations = @project.iterations
    @last_iteration = @project.iterations.last
    @iteration = @project.iterations.find(params[:id])
  end

  # POST /projects/:project_id/iterations(.:format)
  def create
    @project = Project.find(params[:project_id])
    @iterations = @project.iterations
    @iteration = @project.iterations.new(params[:iteration])

    if @iteration.save
      redirect_to project_url(@project), notice: "Iteration was successfully created."
    else
      render action: "new"
    end
  end

  # PUT /projects/:project_id/iterations/:id(.:format)
  def update
    @project = Project.find(params[:project_id])
    @iterations = @project.iterations
    @iteration = @project.iterations.find(params[:id])

    if @iteration.update_attributes(params[:iteration])
      redirect_to project_iteration_url(@project, @iteration), notice: "Iteration was successfully updated."
    else
      render action: "edit"
    end
  end

  # DELETE /projects/:project_id/iterations/:id(.:format)
  def destroy
    @project = Project.find(params[:project_id])
    @iteration = @project.iterations.find(params[:id])
    @iteration.destroy

    redirect_to project_url(@project), notice: "Iteration was successfully deleted."
  end
end
