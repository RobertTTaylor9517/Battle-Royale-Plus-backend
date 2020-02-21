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
            # add specific messages for validation errors
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

    def update
        user = User.find_by(id: current_user.id)

        if user.update(user_params)
            render json: user
        else
            render json: {error: user.errors.full_messages}
        end
    end

    def delete
        user = User.find_by(id: current_user.id)

        if user.destroy
            render json: {message: "Delete Successful"}
        else
            render json: {error: "Delete Unsuccessful"}
        end

    end

private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
