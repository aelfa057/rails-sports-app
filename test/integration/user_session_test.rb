require 'test_helper'

class UserSessionTest < ActionDispatch::IntegrationTest
   
  def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password")
    @team = Team.create(name: "testTeam")
  end
    
    test "Sign in and show user page" do
       sign_in_as(@user, "password")
       get user_path(@user.id)
       assert_template 'users/show'
    end
    
    test "Sign in and open create team link" do
       sign_in_as(@user, "password")
       get new_team_path
        assert_template 'teams/new'
    end
    
    test "sign in and show user teams page" do
      sign_in_as(@user, "password")
      get teams_path
      assert_template 'teams/index'
    end
    
  test "Create team" do
    sign_in_as(@user, "password")
    get new_team_path
    post_via_redirect teams_path, team: {name: "test"}
    #get teams_path()
    assert_template 'users/show'
  end
  
  test "Automatic Login after signup" do
    get signup_path
    post_via_redirect users_path, user: {username: "testuser", email: "testuser@example.com", password: "password"}
    assert_template 'users/show'
  end
  
end