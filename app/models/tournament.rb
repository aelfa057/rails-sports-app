class Tournament < ActiveRecord::Base
    
   has_many :tournament_teams
   has_many :teams, through: :tournament_teams
   
   has_many :rounds
   
    
end