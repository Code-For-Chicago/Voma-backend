require 'rails_helper'

RSpec.describe "API V1 Skills", type: :request do
    describe "POST /api/v1/skills" do
        context "with valid parameters" do 
            let(:valid_params) do
                {
                    name: 'Test name',
                    description: 'a longtext description'
                }
            end

            it "creates a new skill" do
                expect { post "/api/v1/skills", params: valid_params}.to change(Skill, :count).by(+1)
                expect(response).to have_http_status :created
                expect(Skill.last).to have_attributes valid_params
            end
        end
        context "missing required model parameter" do 
            # we're missing the name field here
            let(:invalid_params) do {
                description: "developer"
            }
        end
            it "fails to create a new skill" do
                expect { post "/api/v1/skills", params: invalid_params}.to change(Skill, :count).by(0)
                expect(response).to have_http_status :bad_request 
            end 
        end
    end
end

