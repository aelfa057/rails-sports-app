class CreateRoundTeams < ActiveRecord::Migration
  def change
    create_table :round_teams do |t|
      t.integer :round_id
      t.integer :team_id
    end
  end
end
