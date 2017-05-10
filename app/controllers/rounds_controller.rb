class RoundsController < ApplicationController
   
   before_action :set_tournament
    
   def index
   
   end
   
   def new
   
   end
   
   def create
    @round = Round.new(round_params)
    @round.save
   end
   
   def edit
   
   end
   
   def update
 
   end
   
   def show 
       
   end
   
   private
   
   def round_params
      params.require(:round).permit(:tournament_id, :round_number, :teams_count) 
   end
   
   def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
   end
   
   def set_round_matches
       
   end
   
   def current_round
       
   end
    
end