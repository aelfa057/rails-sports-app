class AddHomeAndAwayTeamIdToMatches < ActiveRecord::Migration
  
  def change
    add_reference :matches, :home_team, index: true
    add_reference :matches, :away_team, index: true
  end
  
end
