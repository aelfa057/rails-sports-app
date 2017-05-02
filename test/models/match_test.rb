require 'test_helper'

class MatchTest < ActiveSupport::TestCase
   
   def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password")
    @team = Team.create(name: "testTeam")
    @match = Match.create(match_date: "123", match_time: "123", location: "123", home_team_id: @team.id)
    @sport = Sport.create(name: "testSport")
    @match.sport = @sport
   end 
   
   test "Is match valid" do
       assert @user.valid?
       assert @team.valid?
       #assert @match.valid?
   end
    
end