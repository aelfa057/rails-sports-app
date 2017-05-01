class AddRatingToMatchReport < ActiveRecord::Migration
  def change
    add_column :reports, :home_team_rating, :integer
    add_column :reports, :away_team_rating, :integer
  end
end
