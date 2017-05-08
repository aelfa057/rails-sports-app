class Round < ActiveRecord::Base
    
    belongs_to :tournament, dependent: :destroy
    
    has_many :round_teams
    has_many :teams, through: :round_teams
    
    has_many :matches, through: :teams
    
end
