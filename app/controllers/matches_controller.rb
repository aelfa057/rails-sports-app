class MatchesController < ApplicationController
    
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_user
    
    def new
        @match = Match.new
    end
    
    def create
        @match = Match.new(match_params)
        @match.user = current_user
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
    
    # It is better to use a sport string instead of making this an association...  we would need to make a sport model
    # Number of sports shouldnt really grow... 
    def match_params
       params.require(:match).permit(:sport_id, :created_by, :match_date, :match_time, :location) 
    end
    
    def require_same_user
      if current_user != @user
      #flash[:danger] = "You can only edit your own account"
      redirect_to user_path
      end
    end
end