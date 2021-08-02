require 'rails_helper'

RSpec.describe "API V1 Volunteers", type: :request do
    describe "POST /api/v1/volunteers" do
        context "with valid parameters" do 
            let(:valid_params) do
                {
                    name: 'Test name',
                    email: 'test@example.com',
                    slackUserId: 'slkdfjas39230523',
                    pronouns: "they/them",
                    employer: "test employer",
                    jobTitle: "developer"
                }
            end

            it "creates a new volunteer" do
                expect { post "/api/v1/volunteers", params: valid_params}.to change(Volunteer, :count).by(+1)
                expect(response).to have_http_status :created
                expect(Volunteer.last).to have_attributes valid_params
            end
        end
        context "missing required model parameter" do 
            # we're missing the name field here
            let(:invalid_params) do {
                email: 'test@example.com',
                slackUserId: 'slkdfjas39230523',
                pronouns: "they/them",
                employer: "test employer",
                jobTitle: "developer"
            }
        end
            it "fails to create a new volunteer" do
                expect { post "/api/v1/volunteers", params: invalid_params}.to change(Volunteer, :count).by(0)
                expect(response).to have_http_status :bad_request 
            end 
        end
    end
end
