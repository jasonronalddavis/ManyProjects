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
            @project = Project.create(project_params)
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
        params.require(:project).permit(:id, :name, :description, :category_id, :total_price, :ingredient_id)
        end
end
