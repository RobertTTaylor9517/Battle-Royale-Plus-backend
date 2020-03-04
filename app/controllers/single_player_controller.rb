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
            enemy['health'] = enemy['health'] - attack['damage']
        end

        if enemy['health'] > 0
            render json: enemy
        else
            floor_enemy = FloorEnemy.find_by(id: floor_enemy_id)
            if(floor_enemy != nil)
                floor_enemy.destroy
            end
            render json: {death: 'Enemy Died', name: enemy['name']}
        end


    end

    def health
        target = Character.find_by(id: params[:character_id])
        new_health = target.health + 25

        if target != nil
            target.update(health: new_health)
        end

        render json: target.to_json(include: [:attacks])

    end

    def hit
        mess = []
        enemy_id = params[:enemy_id]
        team = Team.find_by(id: params[:team_id])
        
        enemy = Enemy.find_by(id: enemy_id)

        attack = enemy.attacks.sample
        target_id = team.characters.sample.id
        target = Character.find_by(id: target_id)

        params[:mess] = [enemy.name, target.name]

        mess.push("#{enemy.name} attacks #{target.name}")

        if(target.focus === attack.element)
            new_health = target.health - (attack.damage/2)
            if(new_health <= 0)
                mess.push("#{target.name} died")
                target.destroy
            else
                target.update(health: new_health)
            end

        else
            new_health = target.health - attack.damage
            if(new_health <= 0)
                mess.push("#{target.name} died")
                target.destroy
            else
                target.update(health: new_health)
            end
        end

        team = Team.find_by(id: params[:team_id])

        # byebug

        render json: {team: team.to_json(include: [characters: {
                include: [:attacks]
            }]), message: mess}
        
    end


end
