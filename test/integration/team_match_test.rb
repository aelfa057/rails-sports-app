require 'test_helper'

class TeamIntegrationTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = User.create(username: "john", email: "john@example.com", password: "password")
        @team = Team.create(name: "testTeam")
    end
    
    test "sign up, create team, and view list of teams" do
        get signup_path
        post_via_redirect users_path, user: {username: "testuser", email: "testuser@example.com", password: "password"}
        assert_template 'users/show'
        get new_team_path
        post_via_redirect teams_path, team: {name: "test2"}
        assert_template 'users/show'
        get teams_path
        assert_template 'teams/index'
    end 

    test "sign in and create new team" do
        post_via_redirect login_path, session: { email: @user.email, password: @user.password }
        assert_template 'users/show'
        get new_team_path
        post_via_redirect teams_path, team: {name: @team.name}
        assert_template 'users/show'
        get teams_path
        assert_template 'teams/index'
        get team_path(@team.id)
        assert_template 'teams/show'
    end
    
end