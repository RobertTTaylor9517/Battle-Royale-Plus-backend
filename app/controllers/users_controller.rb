class UsersController < ApplicationController
    before_action :authenticate_request, except: [:create]

    def create
        # puts(params)
        byebug
        user = User.new(user_params)

        if user.save!
            token = JsonWebToken.encode(user_id: user.id)
            puts(token)
            render json: {token: token}
        else
            render json: {error: 'Did Not Save'}
        end
    end

    def show
        user = User.find_by(id: current_user.id)

        if (user)
            render json: user
        else
            render json: {error: 'User Not Found'}
        end
        
    end

private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
