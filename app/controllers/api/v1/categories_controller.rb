class Api::V1::CategoriesController < ApplicationController

#CONTROLLER ACTIONS EXTRACT FROM FAST JSON API SERILIZER FOR 
#SERIALIZING COMPLEX RELATIONSHIPS 

    def index
        #CONTROLLER ACTION TO FETCH ALL CATEGORIES
        categories = Category.all
        render json: CategorySerializer.new(categories)
        
    end

     def show
        #SHOW ACTION NOT IMPLEMENTED
        category = Category.find_by_id(params[:id])
        render json: category
     end
     


    private
        #WILL USED SANITZED PARAMS FOR EXTENDED FUNCTIONALITY CURRENTLY NOT BEING USED
        def category_params 
        params.require(:category).permit( :id, :name, :ingredient_id, :project_id)
        end
    end


