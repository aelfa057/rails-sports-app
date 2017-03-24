class TeamsController < ApplicationController 
    
    before_action :set_team, only: [:edit, :update, :show, :destroy]
    
    def new
        @team = Team.new
    end
    
    def create

        @team = Team.new(team_params)
        @team.user_id = current_user
        @team.captain = current_user
        # This sets the creater of the team -- a column in the teams table
        if @team.save
            flash[:success] = "Team was successfully created" 
            redirect_to root_path
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
    
    end
    
    def show 
        @team_members = @team.users
        #TODO We need to find a way to access all of a teams matches from the teams show action .. 
    end
    
    
    private
    
    # These are the fields we want to white-list with every call to update/create action
    def team_params
         params.require(:team).permit(:name, user_ids: [])
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