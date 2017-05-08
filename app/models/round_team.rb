class RoundTeam < ActiveRecord::Base
    belongs_to :round
    belongs_to :team
end
