class Api::V1::UsersController < ApplicationController


def index
    users = Users.all
    options = {
    include: [:category]
    }
   #render json: users
    render json: UserSerializer.new(users)
end



    def create 
        user = User.new(user_params)
        if user.save
            render json: user, status: :accepted
        else
            render json: {errors: user.errors.full_messages}, status: 
            :unresponsive_entity
end

end

private

    def user_params 
    params.require(:user).permit( :id, :name, :password, :user_id)
    end
end