class Team < ActiveRecord::Base
    has_many :team_memberships, :dependent => :destroy
    has_many :users, :through => :team_memberships
    
    has_one :captain_team_membership, -> { where captain: true}, class_name: 'TeamMembership'
    has_one :captain, through: :captain_team_membership, source: :user
    
    #validates_associated :team_memberships
end
