class Api::V1::VolunteersController < ApplicationController

  # GET /api/v1/volunteers/:id
  def show
    volunteer = Volunteer.find(params[:id])
    rescue ActiveRecord::RecordNotFound 
    if volunteer
      render json: volunteer
    else
      render json: {error: "Volunteer not found"}
    end
  end  
  
end
