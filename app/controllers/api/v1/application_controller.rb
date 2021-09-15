class Api::V1::ApplicationController < ApplicationController

    def welcome    
      categories = Category.all
         render json: categories
      end
    end
