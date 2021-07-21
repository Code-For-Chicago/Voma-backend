class Api::V1::VolunteersController < ApplicationController

  # GET /api/v1/volunteers/:id
  def show
    volunteer = Volunteer.find(params[:id])
    rescue ActiveRecord::RecordNotFound 
    if volunteer
      render json: volunteer
    else
      render json: {error: "Volunteer not found"}, status: 404
    end
  end  
  
  # POST /api/v1/volunteers
  def create
    volunteer_params = {
        name: params[:name],
        email: params[:email],
        slackUserId: params[:slackUserId],
        pronouns: params[:pronouns],
        primarySkills: params[:primarySkills],
        secondarySkills: params[:secondarySkills],
        employer: params[:employer],
        student: params[:student],
        assignedProjects: params[:assignedProjects],
        jobTitle: params[:jobTitle]
    }

    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
        render json: @volunteer, status: 201
    else
        render error: {error: 'Unable to create Volunteer'}, status: 400
    end
  end

end
