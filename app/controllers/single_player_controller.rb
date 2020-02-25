class SinglePlayerController < ApplicationController
    before_action :authenticate_request


    def attack
        enemy = params[:enemy]
        attack = params[:attack]
        floor_enemy_id = params[:floor_enemy_id]


        puts("Received: #{enemy}")

        if enemy["weakness"] === attack["element"]
            enemy['health'] = enemy['health'] - (attack['damage'] * 2)
        else
            enemy['health'] = enemy['health'] - (attack['damage'])
        end

        if enemy['health'] > 0
            render json: enemy
        else
            floor_enemy = FloorEnemy.find_by(id: floor_enemy_id)
            floor_enemy.destroy
            render json: {death: 'Enemy Died'}
        end


    end

    def hit
        floor_id = params[:floor_id]
        team = Team.find_by(id: params[:team_id])
        

        floor = Floor.find_by(id: floor_id)

        floor.enemies.each do |enem|
            attack = enem.attacks.sample
            target_id = team.characters.sample.id
            target = Character.find_by(id: target_id)

            if target.focus === attack.element
                new_health = target.health - (attack.damage/2)
                puts("Return: #{new_health}")
                target.update(health: new_health)
            else
                new_health = target.health - (attack.damage)
                puts("Return: #{new_health}")
                target.update(health: new_health)
            end


        end

        team = Team.find_by(id: params[:team_id])
        render json: team.to_json(include: [characters: {
                include: [:attacks]
            }])
        
    end

end
