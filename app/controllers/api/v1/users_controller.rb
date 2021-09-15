class Api::V1::UsersController < ApplicationController


def index
    users = User.all

  
    render json: users
end


def show
    user = User.find_by_id(params[:id])
    render json: user
 end

    def create 
        user = User.create(user_params)
        if user.save?
            render json: {user: UserSerializer.new(user)}, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: 
            :unresponsive_entity
    end

end

private

    def user_params 
    params.require(user).permit( :id, :name, :password, category_id, project_id)
    end
end