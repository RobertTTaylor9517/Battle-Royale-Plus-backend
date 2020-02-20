class CharactersController < ApplicationController
    before_action :authenticate_request

    def create 
        character = Character.new(name: params[:name], focus: params[:focus], health: 100, team_id: params[:team_id])

        if character.save!
            attacks = params[:attacks].split(',')
            attacks.each do |att|
                CharacterAttack.create(character_id: character.id, attack_id: att)
            end

            render json: character.to_json(include: [:attacks])
        else
            render json: {error: "Character Not Saved"}
        end
    end

    def delete
        character = Character.find_by(id: params[:id])
        character.character_attacks.destroy_all

        if character.destroy 
            render json: {message: "Character Deleted"}
        else
            render json: {error: "Character Not Deleted"}
        end

    end

private

    # def char_params
    #     params.require(:character)
    # end
end
