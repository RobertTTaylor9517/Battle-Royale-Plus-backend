class DungeonsController < ApplicationController
    before_action :authenticate_request

    def index
        dungeons = Dungeon.all 

        if dungeons.length > 0
            render json: dungeons 
        else
            render json: {error: 'No Dungeons'}
        end

    end
end
