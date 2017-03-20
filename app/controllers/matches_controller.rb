class MatchesController < ApplicationController
    
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_user
    before_action :set_team
    
    def new

        @match = Match.new
        @match.home_team_id = @team.id
        
    end
    
    def create
        
        @match = Match.new(match_params)
        @match.home_team_id = Team.find(params[:team_id])

        
        if @match.save
            redirect_to match_path
        else
            render :new
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
       params.require(:match).permit(:sport_id, :created_by, :match_date, :match_time, :location, :home_team_id, :away_team_id) 
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