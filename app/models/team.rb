class Team < ActiveRecord::Base
    has_many :team_memberships, :dependent => :destroy
    has_many :users, -> { uniq }, through: :team_memberships
    
    has_many :home_matches, :class_name => "Match"
    has_many :away_matches, :class_name => "Match"
    
    has_one :captain_team_membership, -> { where captain: true}, class_name: 'TeamMembership'
    has_one :captain, through: :captain_team_membership, source: :user
    
    has_many :tournament_teams
    has_many :tournaments, through: :tournament_teams
    
    belongs_to :sport
    
    #validates_associated :team_memberships
end
