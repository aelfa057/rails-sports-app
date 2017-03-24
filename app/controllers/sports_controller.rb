class SportsController < ApplicationController
   
   def new
      @sport = Sport.new 
   end
   
   def create
       @sport = Sport.new(sport_params)
       @sport.save
   end
   
   
   private
   
   def sport_params
      params.require(:sport).permit(:name) 
   end
    
end