class Volunteer < ApplicationRecord
    validates_presence_of :name, :email, :slackUserId
end
