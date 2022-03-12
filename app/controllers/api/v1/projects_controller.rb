class Api::V1::ProjectsController < ApplicationController



    def index
        @projects = Project.all   
        render json: ProjectSerializer.new(@projects)
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
        ingredients = Ingredient.all
        categories = Category.all
        project = Project.find_by_id(params[:id])
        removeIng = params[:removeIng] != "" ? params[:removeIng] : []
        addIng =  params[:addIng] != "" ? params[:addIng] : []
        removeCat = params[:removeCat] != "" ? params[:removeCat] : []
        addCat =  params[:addCat] != "" ? params[:addCat] : []
       name = params[:name] != "" ? project.name = params[:name] : project.name
       description = params[:description] != "" ? project.description = params[:description] : project.description
       total_price = params[:total_price] != "" ? project.total_price = params[:total_price] : project.total_price
       project.update({name: name, description: description, total_price: total_price})
        removeIngredients(project,removeIng,ingredients)  
        addIngredients(project,addIng,ingredients) 
        removeCategories(project,removeCat,categories)
        addCategories(project,addCat,categories)
        render json: project
    end
    
    private

def removeIngredients(project,removeIng,ingredients)   
    project.ingredients.select{|pi| 
    ingredients.all.each{|i| 
    removeIng.each{|ri| 
     if  pi.name == ri
        pi.delete  
    end   
             }
            }
        }
end
  
def addIngredients(project,addIng,ingredients)
    ingredients.all.each{|i| 
    addIng.each{|ai| 
    if i.name == ai
        project.ingredients << i
         end
        }
            }
     end

     def removeCategories(project,removeCat,categories)   
        project.categories.select{|pc| 
        categories.all.each{|i| 
        removeCat.each{|rc| 
         if  pc.name == rc
            pc.delete  
        end   
                 }
                }
            }
    end

    def addCategories(project,addCat,categories)
        categories.all.each{|c| 
        addCat.each{|ac| 
        if c.name == ac
            project.categories << c
             end
            }
                }
         end



        def project_params 
        params.require(:project).permit(:id, :name, :description,  :total_price)
        end
end



# def params.select do  |m| 

# puts :category_ids[m]

# end





# def params.select do  |m| 
#   :category_id
#    end




