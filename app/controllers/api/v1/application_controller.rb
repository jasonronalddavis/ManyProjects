class Api::V1::ApplicationController < ApplicationController

    def welcome
      
        user = User.last
        categories = Category.all
         render json: UserSerializer.new(user)
      end
    end
