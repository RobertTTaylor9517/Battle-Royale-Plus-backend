class SavesController < ApplicationController
    before_action :authenticate_request

    def create
        save = SaveState.new(user_id: current_user.id, team_id: params[:team_id], floor_count: params[:floor_count])
        save.team_name = Team.find_by(id: params[:team_id]).team_name

        if save.save!
            render json: save
        else
            render json: {error: 'Did Not Save'}
        end
    end

    def show
        save = SaveState.find_by(id: params[:save_id])

        team = Team.find_by(id: save.team_id)
        dungeon = Dungeon.all.first

        render json: {team: team.to_json(include: [characters: {
            include: [:attacks]
        }]), floor_count: save.floor_count, dungeon: dungeon}
    end
end
