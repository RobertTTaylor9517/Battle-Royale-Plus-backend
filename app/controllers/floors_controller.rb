class FloorsController < ApplicationController

    before_action :authenticate_request

    def create

        easyEnem = Enemy.where(difficulty: 'easy')
        normalEnem = Enemy.where(difficulty: 'normal')
        hardEnem = Enemy.where(difficulty: 'hard')
        miniBossEnem = Enemy.where(difficulty: 'mini_boss')
        bossEnem = Enemy.where(difficulty: 'boss')

        floor = Floor.new(dungeon_id: params[:dungeon_id], difficulty: params[:difficulty])

        if floor.save!
            floor.gen_floor(easyEnem, normalEnem, hardEnem, miniBossEnem, bossEnem)

            render json: floor.to_json(include: [enemies: {
                include: [:attacks]
            }, floor_enemies: {}])
        else
            render json: {error: 'Error Creating Floor'}
        end


    end
end
