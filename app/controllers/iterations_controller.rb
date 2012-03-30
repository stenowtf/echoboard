class IterationsController < ApplicationController
  # GET /projects/:project_id/iterations/:id(.:format)
  def show
    @project = Project.find(params[:project_id])
    @iteration = @project.iterations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iteration }
    end
  end

  # GET /projects/:project_id/iterations/new(.:format)
  def new
    @project = Project.find(params[:project_id])
    @iteration = @project.iterations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iteration }
    end
  end

  # GET /projects/:project_id/iterations/:id/edit(.:format)
  def edit
    @project = Project.find(params[:project_id])
    @iteration = @project.iterations.find(params[:id])
  end

  # POST /projects/:project_id/iterations(.:format)
  def create
    @project = Project.find(params[:project_id])
    @iteration = @project.iterations.new(params[:iteration])

    respond_to do |format|
      if @iteration.save
        format.html { redirect_to project_iteration_url(@project, @iteration), notice: 'Iteration was successfully created.' }
        format.json { render json: @iteration, status: :created, location: @iteration }
      else
        format.html { render action: "new" }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/:project_id/iterations/:id(.:format)
  def update
    @project = Project.find(params[:project_id])
    @iteration = @project.iterations.find(params[:id])

    respond_to do |format|
      if @iteration.update_attributes(params[:iteration])
        format.html { redirect_to project_iteration_url(@project, @iteration), notice: 'Iteration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/:project_id/iterations/:id(.:format)
  def destroy
    @project = Project.find(params[:project_id])
    @iteration = @project.iterations.find(params[:id])
    @iteration.destroy

    respond_to do |format|
      format.html { redirect_to project_iterations_url(@project) }
      format.json { head :no_content }
    end
  end
end
