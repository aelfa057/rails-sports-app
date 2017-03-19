# app/controllers/team_memberships_controller.rb
class TeamMembershipsController < ApplicationController
    
      def index
        @team_memberships = TeamMembership.all
      end
    
      def new
        @team_membership = TeamMembership.new
      end
    
      def create
        @team_membership = TeamMembership.new(team_membership_params)
        if @team_membership.save
          flash[:success] = 'Team membership created'
          redirect_to team_memberships_path
        else
          flash[:error] = 'Team membership not created'
          render :new
        end
      end
    
      def destroy
        @team_membership = TeamMembership.find_by_id(params[:id])
        if @team_membership && @team_membership.destroy
          flash[:success] = 'Team membership destroyed'
        else
          flash[:error] = 'Team membership not destroyed'
        end
        redirect_to team_memberships_path
      end
    
    
      private
      def team_membership_params
        params.require(:team_membership).permit(
          :user,
          :team
        )
      end
end