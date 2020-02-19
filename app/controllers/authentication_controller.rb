class AuthenticationController < ApplicationController

    def authenticate
        puts("Recieved Params: #{params}")
        command = AuthenticateUser.call(params[:username], params[:password])
        
        if command.success?
            temp = JsonWebToken.decode(command.result)
            user = User.find_by(id: temp['user_id'])

            render json: {token: command.result}
        else
            render json: {error: 'Invalid Login'}
        end
    end
end
