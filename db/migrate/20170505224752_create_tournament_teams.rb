class CreateTournamentTeams < ActiveRecord::Migration
  def change
    create_table :tournament_teams do |t|
      t.integer :tournament_id
      t.integer :team_id
    end
  end
end
