class MatchesController < ApplicationController
    
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_user
    #before_action :set_team
    
    def new

        @match = Match.new
        
    end
    
    def create
        
        @match = Match.new(match_params)
        @team = Team.find(@match.home_team_id)
        @sport = Sport.find(@team.sport_id)
        @match.sport = @sport
        
        if @match.save
            current_user.matches << @match
            flash[:success] = "You have successfully created a team! Invite some friends :)"
            redirect_to match_path(@match)
        else
            flash[:danger] = "There was an issue creating the team, please try again."
            render 'new'
        end
        
    end
    
    def update
    
    end
    
    def index
        @matches = Match.paginate(page: params[:page], per_page: 10)
    end
    
    def edit
        
    end

    
    private
    

    def match_params
       params.require(:match).permit(:match_date, :match_time, :location, :home_team_id) 
    end
    
    def require_same_user
      if current_user != @user
      #flash[:danger] = "You can only edit your own account"
      redirect_to user_path
      end
    end
    
    def set_team
       @team = Team.find(params[:team_id]) 
    end
    
end