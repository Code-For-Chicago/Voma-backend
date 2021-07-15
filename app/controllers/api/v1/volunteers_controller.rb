class Api::V1::VolunteersController < ApplicationController

  # GET /api/vi/volunteers/:id
  def show
    volunteer = Volunteer.find(params[:id])
    if volunteer
      render json: volunteer
    else
      render json: {error: "Volunteer not found"}
    end
  end  
  
end
