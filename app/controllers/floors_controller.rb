class FloorsController < ApplicationController

    before_action :authenticate_request

    def create

        floor = Floor.new(dungeon_id: params[:dungeon_id], difficulty: params[:difficulty])

        if floor.save!
            floor.gen_floor()

            render json: floor.to_json(include: [enemies: {
                include: [:attacks]
            }, floor_enemies: {}])
        else
            render json: {error: 'Error Creating Floor'}
        end


    end
end
