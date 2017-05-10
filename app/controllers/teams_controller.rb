class TeamsController < ApplicationController 
    
    before_action :set_team, only: [:edit, :update, :show, :destroy]
    
    def new
        @team = Team.new
    end
    
    def create

        @team = Team.new(team_params)
        @team.captain = current_user
        # This sets the creater of the team -- a column in the teams table
        
        if @team.save && Tournament.exists?(params[:tournament_id])
            flash[:success] = "Team was successfully created" 
            redirect_to user_path(current_user)
        else
            render 'new'
        end
        
    end
    
    def edit
    
    end
    
    def update
        
        if @team.update(team_params)
            flash[:success] = "Team was successfully updated" 
            redirect_to team_path(@team)
        else
            render 'edit'
        end
        
    end
    
    def index
        @user_teams = current_user.teams.paginate(page: params[:page], per_page: 6)
    end
    
    def show 
        @team_members = @team.team_memberships
        @matches = Match.where(:home_team_id == @team.id || :away_team_id == @team.id)
    end
    
    
    private
    
    # These are the fields we want to white-list with every call to update/create action
    def team_params
         params.require(:team).permit(:name, :sport_id, user_ids: [], tournament_ids: [])
    end
    
    def users_from_params
        #This members_params[:members_attributes].values should be an array of `id`s
        User.find(team_memberships_params[:team_membership_attributes].values)
    end
    
    
    # Checks the URL parameters to idenitfy the current team 
    def set_team
      @team = Team.find(params[:id])
    end
    
end