class CreateTournamentsTable < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :location
      t.integer :number_of_teams
      t.integer :sport_id, index: true
      t.date :date
      t.string :start_time
      t.string :end_time
    end
  end
end
