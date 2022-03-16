class Api::V1::ProjectsController < ApplicationController

#CONTROLLER ACTIONS EXTRACT FROM FAST JSON API SERILIZER FOR 
#SERIALIZING COMPLEX RELATIONSHIPS 

    def index
        #CONTROLLER ACTION TO FETCH ALL PROJECTS
        @projects = Project.all   
        render json: ProjectSerializer.new(@projects)
    end


    def show
        #SHOW ACTION NOT IMPLEMENTED
        project = Project.find_by_id(params[:id])
        project_categories = project.categories
       project_ingredients = project.ingredients
        render json: { project: project, project_categories: project_categories, project_ingredients: project_ingredients}
     end
    

    
        def create  
            #ASSIGNING ALL INGREDIENTS TO VARIABLE
            ingredients = Ingredient.all
            #ASSIGNING ALL CATEGORIES TO VARIABLE
            categories = Category.all 
            # BELOW TERNARY OPERATORS ARE ASSIGNED TO COLLECTION OF INGREDIENTS IF NOT EMPTY ASSIGN PARAMS,
            #OTHERWISE SET TO EMPTY ARRAY
            #TERNARY OPERATOR SET TO AVOID OVERWRITING COLLECTION WITH EMPTY VALUE 
            #VARIABLE ADD INGREDIENTS PARAMS     
           addIng =  params[:addIng] != "" ? params[:addIng] : []
            #VARIABLE ADD CATEGORY PARAMS
           addCat =  params[:addCat] != "" ? params[:addCat] : []
            #VARIABLE CAPTURING NAME PARAMS
           name = params[:name] 
           #VARIABLE CAPTURING DESCRIPTION PARAMS
           description = params[:description] 
           #VARIABLE CAPTURING TOTAL_PRICE PARAMS
           total_price = params[:total_price]
            #CALL CREATE METHOD ON PROJECT WITH RECIEVED PARAMS 
             #EXTENDED FUNCTIONALITY WILL ENTAIL BACKEND VALIDATION MESSAGE PROMPTS REGARDING A FAILED OR SUCCESSFUL CREATE 
           project = Project.create({name: name, description: description, total_price: total_price})
             #PRIVATE METHOD FILTERS PARAM COLLECTION OF SELECTED CATEGORIES
             #COLLECTION OF NAMES ARE MATCHED WITH CATEGORY OBJECTS AND ADDED TO COLLECTION
           addCategories(project,addCat,categories)
           #PRIVATE METHOD FILTERS PARAM COLLECTION OF SELECTED INGREDIENTS
             #COLLECTION OF NAMES ARE MATCHED WITH INGREDIENT OBJECTS AND ADDED TO COLLECTION
           addIngredients(project,addIng,ingredients)
           if project.save             
                render json:{project: project }, status: :created
            else
                render json: {errors: project.errors.full_messages}, status: 
                :unresponsive_entity
        end
    end


    def update
        #ASSIGNING ALL INGREDIENTS TO VARIABLE
        ingredients = Ingredient.all
        #ASSIGNING ALL CATEGORIES TO VARIABLE
        categories = Category.all
        #LOCATING PREOJECT BY PARAMS ID
        project = Project.find_by_id(params[:id])

        # BELOW TERNARY OPERATORS ARE ASSIGNED TO COLLECTION OF INGREDIENTS IF NOT EMPTY ASSIGN PARAMS,
        #OTHERWISE SET TO EMPTY ARRAY
        #TERNARY OPERATOR SET TO AVOID OVERWRITING COLLECTION WITH EMPTY VALUE 
        #VARIABLE CAPTURING REMOVE INGREDIENTS PARAMS
        removeIng = params[:removeIng] != "" ? params[:removeIng] : []
         #VARIABLE ADD INGREDIENTS PARAMS
        addIng =  params[:addIng] != "" ? params[:addIng] : []
       #VARIABLE CAPTURING REMOVE CATEGORIES PARAMS
        removeCat = params[:removeCat] != "" ? params[:removeCat] : []
        #VARIABLE CAPTURING ADD CATEGORIES PARAMS
        addCat =  params[:addCat] != "" ? params[:addCat] : []
        #VARIABLE CAPTURING NAME PARAMS
        name = params[:name] != "" ? project.name = params[:name] : project.name
        #VARIABLE CAPTURING DESCRIPTION PARAMS
        description = params[:description] != "" ? project.description = params[:description] : project.description
        #VARIABLE CAPTURING TOTAL_PRICE PARAMS
        total_price = params[:total_price] != "" ? project.total_price = params[:total_price] : project.total_price
        #CALL UPDATE METHOD ON PROJECT WITH RECIEVED PARAMS 
        #EXTENDED FUNCTIONALITY WILL ENTAIL BACKEND VALIDATION MESSAGE PROMPTS REGARDING A FAILED OR SUCCESSFUL UPDATE 
        project.update({name: name, description: description, total_price: total_price})
        #PRIVATE METHOD FILTERS PARAM COLLECTION OF PROJECT-INGREDIENT OBJECTS BY NAME AND REMOVE FROM COLLECTION
        removeIngredients(project,removeIng,ingredients)  
         #PRIVATE METHOD FILTERS PARAM COLLECTION OF SELECTED INGREDIENTS
         #COLLECTION OF NAMES ARE MATCHED WITH INGREDIENT OBJECTS AND ADDED TO COLLECTION
        addIngredients(project,addIng,ingredients) 
        #PRIVATE METHOD FILTERS PARAM COLLECTION OF PROJECT-CATEGORY OBJECTS BY NAME AND REMOVE FROM COLLECTION
        removeCategories(project,removeCat,categories)
          #PRIVATE METHOD FILTERS PARAM COLLECTION OF SELECTED CATEGORIES
         #COLLECTION OF NAMES ARE MATCHED WITH CATEGORY OBJECTS AND ADDED TO COLLECTION
        addCategories(project,addCat,categories)
        render json: project
    end


    def destroy
        #CONTROLLER ACTION TO DELETE A PROJECT 
        #LOCATES PROJECT BY PARAMS ID
        project = Project.find_by_id(params[:id])
        project.delete
    end
    
    private

        # INTEND TO REFACTOR BELOW METHODS INTO A SINGLE METHOD WITHIN APPLICATION CONTROLLER

    #PRIVATE METHOD TO LOOP THROUGH  REMOVE INGREDIENT PARAMS 
    #AND PROJECT-INGREDIENTS TO RETURN MATCHING OBTECTS FOR REMOVAL
    def removeIngredients(project,removeIng,ingredients)   
         project.ingredients.select{|pi|       
            removeIng.each{|ri| 
         if  pi.name == ri
        project.ingredients.delete(pi) 
        end   
             }
            }      
    end
  

        def addIngredients(project,addIng,ingredients)
         #PRIVATE METHOD TO LOOP THROUGH ADD INGREDIENT PARAMS 
         #AND ALL BACK END INGREDIENTS TO RETURN MATCHING OBTECTS FOR ADDITION TO COLLECTION 
            ingredients.all.each{|i| 
            addIng.each{|ai| 
        if i.name == ai
        project.ingredients << i
         end
                }
            }
        end


     def removeCategories(project,removeCat,categories)  
          #PRIVATE METHOD TO LOOP THROUGH INGREDIENT PARAMS 
          #AND PROJECT-INGREDIENTS TO RETURN MATCHING OBTECTS FOR REMOVAL 
        project.categories.select{|pc| 
        removeCat.each{|rc| 
         if  pc.name == rc
            project.categories.delete(pc) 
        end   
                 }
                }
    end

    def addCategories(project,addCat,categories)
        #PRIVATE METHOD TO LOOP THROUGH ADD CATEGORY PARAMS 
         #AND ALL BACK END CATEGORIES TO RETURN MATCHING OBTECTS FOR ADDITION TO COLLECTION 
        categories.all.each{|c| 
        addCat.each{|ac| 
        if c.name == ac
            project.categories << c
             end
            }
                }
         end


        #WILL USED SANITZED PARAMS FOR EXTENDED FUNCTIONALITY CURRENTLY NOT BEING USED
        def project_params 
        params.require(:project).permit(:id, :name, :description,  :total_price)
        end
    end






