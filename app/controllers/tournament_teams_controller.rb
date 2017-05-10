class TournamentTeamsController < ApplicationController
  before_action :set_tournament
    
      def index
        @tournament_teams = TournamentTeam.where("tournament_id = ?", @tournament.id)
      end
    
      def new
        @teams = current_user.teams.all
        @tournament_team = TournamentTeam.new
      end
    
      def create
        @tournament_team = TournamentTeam.new(params.permit(:tournament_id, :team_id))
        if @tournament_team.save
          flash[:success] = 'Tournament team created'
          redirect_to tournament_tournament_teams_path(@tournament.id)
        else
          flash[:error] = 'Tournament team not created'
          render :new
        end
      end
    
      def destroy
        @tournament_team = TournamentTeam.find_by_id(params[:id])
        if @tournament_team && @tournament_team.destroy
          flash[:success] = 'Tournament team destroyed'
        else
          flash[:error] = 'Tournament team not destroyed'
        end
        redirect_to tournament_teams_path
      end
    
    
      private
      
      def tournament_team_params
        params.require(:tournament_team).permit(
          :tournament_id,
          :team_id
        )
      end
      
      def set_tournament
        @tournament = Tournament.find(params[:tournament_id])
      end
end