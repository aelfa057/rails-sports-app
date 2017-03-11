class TeamsController < ApplicationController 
    
    
    def new
        @team = Team.new
    end
    
    def create
        @team = Team.new(team_params)
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def index
    
    end
    
    def show 
        
    end
    
    
    private
    
    # These are the fields we want to white-list with every call to update/create 
    def team_params
         params.require(:team).permit(:name, user_ids: [])
        
    end
    
    
end