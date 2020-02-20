class SinglePlayerController < ApplicationController
    before_action :authenticate_request



    def start
        @easyEnem = Enemy.where(difficulty: 'easy')
        @normalEnem = Enemy.where(difficulty: 'normal')
        @hardEnem = Enemy.where(difficulty: 'hard')
        @miniBossEnem = Enemy.where(difficulty: 'mini_boss')
        @bossEnem = Enemy.where(difficulty: 'boss')

        @dungeon = Dungeon.find_by(id: params[:id])

        @dungeon.floors.each do |floor|
            floor.floor_enemies.destroy_all
            case floor.difficulty
            when 'easy'
                puts(@easyEnem)
                rand(1..2).times do
                    FloorEnemy.create(floor_id: floor.id, enemy_id: @easyEnem.sample.id)
                end
            when 'normal'
                rand(1..2).times do
                    FloorEnemy.create(floor_id: floor.id, enemy_id: @normalEnem.sample.id)
                end
                rand(2..3).times do
                    FloorEnemy.create(floor_id: floor.id, enemy_id: @easyEnem.sample.id)
                end
            when 'hard'
                rand(1..2).times do
                    FloorEnemy.create(floor_id: floor.id, enemy_id: @hardEnem.sample.id)
                end
                rand(2..3).times do
                    FloorEnemy.create(floor_id: floor.id, enemy_id: @normalEnem.sample.id)
                end
            when 'harder'
                rand(3..4).times do
                    FloorEnemy.create(floor_id: floor.id, enemy_id: @hardEnem.sample.id)
                end
            when 'mini_boss'
                FloorEnemy.create(floor_id: floor.id, enemy_id: @miniBossEnem.sample.id)
            when 'boss'
                FloorEnemy.create(floor_id: floor.id, enemy_id: @bossEnem.sample.id)
            end
        end

        render json: @dungeon.to_json(include: [floors: {

            include: [enemies: {
                include: [:attacks]
            }]
        
        }])

    end
end
