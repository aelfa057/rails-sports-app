class TournamentsController < ApplicationController
   
   
   def index
      @tournaments = Tournament.all
   end
    
   def new
       @tournament = Tournament.new
   end
   
   def create
      @tournament = Tournament.new(tournament_params)
      if @tournament.save
         build_default_rounds(@tournament)
         flash[:success] = "Tournament successfully created, send some invites!"
         redirect_to tournament_path(@tournament)
      else
         flash[:danger] = "Something went wrong, please try again"
         render 'new'
      end
   end
   
   def edit
      @tournament = Tournament.find(params[:id])
   end
   
   def show
      @tournament = Tournament.find(params[:id])
   end
   
   def destroy
       
   end
   
   def register
      @tournament = Tournament.find(params[:id])
      @team = Team.new
   end
   
   private
   
   def tournament_params
      params.require(:tournament).permit(:location, :number_of_teams, :sport_id, :date, :start_time, :end_time, team_ids: [])
   end
   
   # This method builds the rounds for a tournament (it is called from the create tournament method after tournament.save)
   # Important to note that this is a prototype method and only offers a tournament of three rounds (8 teams single elimination)
   def build_default_rounds(tournament)
      @rounds = []
      3.times do |i|
         @round = Round.new(tournament_id: tournament.id, round_number: i + 1) # i is index-0 so we need to add 1
         if i == 1
           @round.teams_count = 8
           @round.teams << tournament.teams
         elsif i == 2
           @round.teams_count = 0
           elsif i == 3
           @round.teams_count = 0
         end
         #build_round_matchups(@round)
         @round.save
      end
   end
   
   def build_round_matchups(round)
      
   end
    
    
end