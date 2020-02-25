class DungeonsController < ApplicationController
    before_action :authenticate_request

    def index
        dungeon = Dungeon.all.first 

        if dungeon
            render json: dungeon 
        else
            render json: {error: 'No Dungeons'}
        end

    end
end
