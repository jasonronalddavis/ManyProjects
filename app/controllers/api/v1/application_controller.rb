class Api::V1::ApplicationController < ApplicationController

    def welcome
      
      
        categories = Category.all
         render json: CategorySerializer.new(categories)
      end
    end
