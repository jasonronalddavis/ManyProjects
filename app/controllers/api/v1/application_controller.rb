class Api::V1::ApplicationController < ApplicationController

    def welcome
      
        category = Category.last
        categories = Category.all
         render json: CategorySerializer.new(category)
      end
    end
