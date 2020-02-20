class TeamsController < ApplicationController
    before_action :authenticate_request

    def create
        team = Team.new(team_params.merge(user_id: current_user.id))

        if team.save!
            render json: team
        else
            render json: {error: "Did Not Save Team"}
        end
    end

    def show
        team = Team.find_by(id: params[:id])

        if team
            render json: team
        else
            render json: {error: 'Team Not Found'}
        end
    end

    def delete
        team = Team.find_by(id: params[:id])
        team.characters.each do |char|
            char.character_attacks.destroy_all
        end
        
        team.characters.destroy_all

        if team.destroy
            render json: {message: "Team Deleted"}
        else
            render json: {error: "Team NOT Deleted"}
        end
    end

private

    def team_params
        params.require(:team).permit(:team_name)
    end
end
