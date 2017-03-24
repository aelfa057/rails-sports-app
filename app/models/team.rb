class Team < ActiveRecord::Base
    has_many :team_memberships, :dependent => :destroy
    has_many :users, -> { uniq }, through: :team_memberships
    
    has_many :home_matches, :foreign_key => :home_team_id, :class_name => :matches
    has_many :away_matches, :foreign_key => :away_team_id, :class_name => :matches
    
    has_one :captain_team_membership, -> { where captain: true}, class_name: 'TeamMembership'
    has_one :captain, through: :captain_team_membership, source: :user
    
    belongs_to :sport
    
    #validates_associated :team_memberships
end
