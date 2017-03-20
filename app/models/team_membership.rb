class TeamMembership < ActiveRecord::Base
    # This model is used to store a table representing all team members 
    # Consists of 2 foreign key columns: team_id, user_id
    belongs_to :team
    belongs_to :user
    
end
