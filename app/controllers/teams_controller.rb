require 'securerandom'
class TeamsController < ApplicationController
    before_action :authenticate_request

    def create
        team = Team.new(team_params.merge(user_id: current_user.id))

        if team.save!
            render json: team.to_json(include: [:characters])
        else
            # add specific arror messages
            render json: {error: team.errors.full_messages}
        end
    end

    def show
        team = Team.find_by(id: params[:id])

        if team
            render json: team.to_json(include: [characters: {
                include: [:attacks]
            }])
        else
            render json: {error: 'Team Not Found'}
        end
    end

    def delete
        team = Team.find_by(id: params[:id])

        if team.destroy
            render json: {message: "Team Deleted"}
        else
            render json: {error: "Team NOT Deleted"}
        end
    end

    def random
        team = Team.find_by(id: params[:team_id])

        team.generate_team()

        render json: team.to_json(include: [characters: {
            include: [:attacks]
        }])
    end

private

    def team_params
        # add id
        params.require(:team).permit(:team_name)
    end
end
