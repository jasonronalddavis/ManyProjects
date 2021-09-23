class Api::V1::ProjectsController < ApplicationController



    def index
        projects = Project.all

        render json: projects
    end


    def show
        project = Project.find_by_id(params[:id])
        render json: project
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
    
    private
    
        def project_params 
        params.require(:project).permit(:id, :name, :description, :total_price)
        end
end
