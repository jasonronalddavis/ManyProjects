class Api::V1::IngredientsController < ApplicationController



    def index
        ingredients = Ingredient.all
        ingredient = Ingredient.find_by_id(params[:id])
        render json: ingredients
    end
    
    

    def show
        ingredient = Ingredient.find_by_id(params[:id])
        render json:  ingredient
     end
     


    
        def create 
            ingredient = Ingredient.create(ingredient_params)
            if ingredient.save?
                render json: ingredient
            else
                render json: {errors: ingredient.errors.full_messages}, status: 
                :unresponsive_entity
        end
    end
    
    private
    
        def ingredient_params 
        params.require(:ingredient).permit(:id, :name, :description, :url, :price)
        end
    end
