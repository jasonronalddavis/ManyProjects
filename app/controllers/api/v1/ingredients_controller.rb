class Api::V1::IngredientsController < ApplicationController



    def index
        ingredients = Ingredient.all
        render json: ingredients
    end
    
    

    def show
        ingredient = Ingredient.find_by_id(params[:id])
        render json:  ingredient
     end
     
     def destroy
     ingredient = Ingredient.find_by_id(params[:id])
     ingredient.delete
    end
    

    
        def create 
            @this = params[:category_ids]
            @array = Category.all.find(@this)
            @ingredient = Ingredient.create(ingredient_params)
            @array.each{|i| @ingredient.categories << i}  
           #  binding.pry   
             if @ingredient.save             
                 render json:{ingredient: @ingredient }, status: :created
             else
                 render json: {errors: @ingredient.errors.full_messages}, status: 
                 :unresponsive_entity
         end
    end
    
    private
    
        def ingredient_params 
        params.require(:ingredient).permit(:id, :name, :description, :image_url, :url, :price, :category_ids)
        end
    end
