class Match < ActiveRecord::Base
    
    belongs_to :home_team, :class_name => :team
    belongs_to :away_team, :class_name => :team
    
end