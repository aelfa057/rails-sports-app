class AddSportIdToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :sport, index: :true
  end
end
