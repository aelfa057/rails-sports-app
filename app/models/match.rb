class Match < ActiveRecord::Base
    
    validates :sport_id, :match_date, :match_time, :location, :home_team_id, presence: true
    
    belongs_to :home_team, :class_name => :team
    belongs_to :away_team, :class_name => :team
    
    belongs_to :sport
    
end