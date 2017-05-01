class ReportController < ApplicationController
  before_action :set_match, only: [:edit, :update]
   
   def edit
    @report = Report.find(params[:id])
   end
   
   def update
    @report = Report.find(params[:id])
    if @report.update(report_params) && !reported
        flash[:success] = "Match Succesffuly Reported"
        redirect_to team_path(params[:team_id])
    elsif reported
        flash[:danger] = "You can not edit this match as it has already been reported"
        redirect_to team_path(params[:team_id])
    else
        render 'edit'
    end
   end
   
   private
   
   def reported
       @report = Report.find(params[:id])
       @report.winner_id_from_away && @report.winner_id_from_home
   end
   
   def report_params
     params.require(:report).permit(:match_id, :winner_id_from_home, :winner_id_from_away) 
   end
   
   def set_match
     @match = Match.find(params[:match_id])
   end
   
    
end