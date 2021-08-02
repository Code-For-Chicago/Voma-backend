class Api::V1::ProjectsController < ApplicationController

  # GET /api/v1/projects/:id
  def show
    project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound 
    if project
      render json: project
    else
      render json: {error: "Project not found"}, status: 404
    end
  end  
  
  # POST /api/v1/projects
  def create
    project_params = {
        name: params[:name],
        description: params[:description]
    }

    @project = Project.new(project_params)
    if @project.save
        render json: @project, status: 201
    else
        render error: {error: 'Unable to create Project'}, status: 400
    end
  end

end


