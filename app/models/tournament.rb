class Tournament < ActiveRecord::Base
    
   has_many :tournament_teams, dependent: :destroy
   has_many :teams, -> { uniq }, through: :tournament_teams
   
   has_many :rounds
   
    
end