class SavesController < ApplicationController
    def create
        save = Save.new(user_id: params[:user_id], team_id: params[:team_id], floor_count: params[:floor_count])

        if save.save!
            render json: save
        else
            render json: {error: 'Did Not Save'}
        end
    end

    def show
        save = Save.find_by(id: params[:save_id])

        team = Team.find_by(id: save.team_id)

        render json: {team: team.to_json(include: [characters: {
            include: [:attacks]
        }]), floor_count: save.floor_count}
    end
end
