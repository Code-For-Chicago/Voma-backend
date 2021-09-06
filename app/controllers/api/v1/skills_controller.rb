class Api::V1::SkillsController < ApplicationController

  # GET /api/v1/skills/:id
  def show
    skill = Skill.find(params[:id])
    rescue ActiveRecord::RecordNotFound 
    if skill
      render json: skill
    else
      render json: {error: "Skill not found"}, status: 404
    end
  end  
  
  # POST /api/v1/skills
  def create
    skill_params = {
        name: params[:name],
        description: params[:description]
    }

    @skill = Skill.new(skill_params)
    if @skill.save
        render json: @skill, status: 201
    else
        render error: {error: 'Unable to create Skill'}, status: 400
    end
  end

end

