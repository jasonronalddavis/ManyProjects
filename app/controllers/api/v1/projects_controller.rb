class Api::V1::ProjectsController < ApplicationController



    def index
        projects = Project.all   
        render json: projects
    end


    def show
        project = Project.find_by_id(params[:id])
       project_categories = project.categories
       project_ingredients = project.ingredients
        render json: { project: project, project_categories: project_categories, project_ingredients: project_ingredients}
       # render json: project
        
       # render json: project_categories
     end
    


def destroy
    project = Project.find_by_id(params[:id])
    project.delete
end

    
    
        def create        
            @categories = params[:category_ids]
            @ingredients = params[:ingredient_ids]
            @i_array = Ingredient.all.find(@ingredients)
           @c_array = Category.all.find(@categories)
           @project = Project.create(project_params)
           @c_array.each{|c| @project.categories << c}  
           @i_array.each{|i| @project.ingredients << i} 
           #binding.pry   
            if @project.save             
                render json:{project: @project }, status: :created
            else
                render json: {errors: @project.errors.full_messages}, status: 
                :unresponsive_entity
        end
    end



    def edit
        project = Project.find_by_id(params[:id]) 
        render json: project

    end

    def update
      #  binding.pry 
        project = Project.find_by_id(params[:id])
        project.update(project_params)
        render json: project
    end
    
    private
    
        def project_params 
        params.require(:project).permit(:id, :name, :description,  :total_price, :ingredient_ids, :category_ids)
        end
end



# def params.select do  |m| 

# puts :category_ids[m]

# end





# def params.select do  |m| 
#   :category_id
#    end




