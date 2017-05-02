class MatchesController < ApplicationController
    
    #before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_user
    before_action :set_team
    before_action :require_team_member, except: [:show]

    def new
        @match = Match.new
    end
    
    def create
        @match = Match.new(match_params)
        @team = Team.find(params[:team_id])
        @sport = Sport.find(@team.sport_id)
        @match.sport = @sport
        
        if @match.save
            current_user.matches << @match
            flash[:success] = "You have successfully created a team! Invite some friends :)"
            redirect_to team_path(@team)
        else
            flash[:danger] = "There was an issue creating the team, please try again."
            render 'new'
        end
    end
    
    def update
      @match = Match.find(params[:match_id])
      if @match.update(match_params)
        flash[:success] = "Team was successfully updated" 
        redirect_to team_path(@team)
      else
        render 'report'
      end
    end
    
    def index
        @matches = Match.paginate(page: params[:page], per_page: 10)
    end
    
    def edit
        
    end

    def show
        
    end
    
    def report
       @match = Match.find(params[:match_id])
       @match_teams = Team.find([@match.home_team_id, @match.away_team_id])
    end
    
    private
    

    def match_params
       params.require(:match).permit(:match_date, :match_time, :location, :home_team_id, :away_team_id, :winner_id) 
    end
    
    
    
    def require_same_user
      if current_user != @user
      #flash[:danger] = "You can only edit your own account"
      redirect_to user_path
      end
    end
    
    # This method queries the team_memberships table to validate the relationship between current user and team 
    def require_team_member
      @team = Team.find(params[:team_id])
      if TeamMembership.where('team_id = ? AND user_id = ?', @team.id, current_user.id).blank?
        flash[:danger] = "Oops! Only team members can do that! :("
        redirect_to team_path(@team)
      end
    end
    
    def set_team
       @team = Team.find(params[:team_id]) 
    end
    
end