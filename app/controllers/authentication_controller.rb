class AuthenticationController < ApplicationController

    def authenticate
        puts("Recieved Params: #{params}")
        command = AuthenticateUser.call(params[:username], params[:password])
        
        if command.success?
            temp = JsonWebToken.decode(command.result)
            user = User.find_by(id: temp['user_id'])
            attacks = Attack.all 

            render json: {token: command.result, user: user.to_json(except: [:password_digest]), saves: user.save_states, attacks: attacks}
        else
            render json: {error: command.errors.full_messages}
        end
    end
end
