class Api::V1::IngredientsController < ApplicationController



    def index
        ingredients = Ingredients.all
        options = {
        include: [:category]
        }
       #render json: ingredients
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
        params.require(:ingredient).permit(:id, :name, :category_id, :project_id)
        end
    end
