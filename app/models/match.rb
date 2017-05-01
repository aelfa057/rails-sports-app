class Match < ActiveRecord::Base
    
    validates :match_date, :match_time, :location, :home_team_id, presence: true
    
    belongs_to :home_team, :class_name => 'Team'
    belongs_to :away_team, :class_name => 'Team'
    
    has_one :report
    
    belongs_to :sport
    
end