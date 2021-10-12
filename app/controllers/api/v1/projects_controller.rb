class Api::V1::ProjectsController < ApplicationController



    def index
        projects = Project.all   
        render json: projects
    end


    def show
        project = Project.find_by_id(params[:id])
        
        render json: project
     end
     



def destroy
    project = Project.find_by_id(params[:id])
    project.delete
end

    
    
        def create 
          
            @this = params[:category_ids]
           @array = Category.all.find(@this)
           @project = Project.create(project_params)
           @array.each{|c| @project.categories << c}  
          #  binding.pry   
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
        project = Project.find_by_id(params[:id])
        project.update(project_params)
        render json: project
    end
    
    private
    
        def project_params 
        params.require(:project).permit(:id, :name, :description, :total_price, :category_ids)
        end
end



# def params.select do  |m| 

# puts :category_ids[m]

# end





# def params.select do  |m| 
#   :category_id
#    end




