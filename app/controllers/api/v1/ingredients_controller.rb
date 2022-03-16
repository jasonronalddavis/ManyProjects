class Api::V1::IngredientsController < ApplicationController

#CONTROLLER ACTIONS EXTRACT FROM FAST JSON API SERILIZER FOR 
#SERIALIZING COMPLEX RELATIONSHIPS 

    def index
     #CONTROLLER ACTION TO FETCH ALL INGREDIENTS
        ingredients = Ingredient.all
       render json: IngredientSerializer.new(ingredients)

    end
    
    

    def show
        #SHOW ACTION NOT IMPLEMENTED
        ingredient = Ingredient.find_by_id(params[:id])
        ingredient_categories = ingredient.categories
        ingredient_projects = ingredient.projects
         render json: { ingredient: ingredient, ingredient_categories: ingredient_categories, ingredient_projects: ingredient_projects}
     end


     
    
    

    
        def create 
            #ASSIGNING ALL CATEGORIES TO VARIABLE
            categories = Category.all
            #VARIABLE CAPTURING ADD CATEGORIES PARAMS
            addCat =  params[:addCat] != "" ? params[:addCat] : []
             #VARIABLE CAPTURING NAME PARAMS
            name = params[:name] 
            #VARIABLE CAPTURING DESCRIPTION PARAMS 
            description = params[:description] 
            #VARIABLE CAPTURING TOTAL_PRICE PARAMS
            price = params[:price]
            #VARIABLE CAPTURING IMAGE_URL PARAMS
            image_url = params[:imageUrl]
            #CALL CREATE METHOD ON INGREDIENT WITH RECIEVED PARAMS 
             #EXTENDED FUNCTIONALITY WILL ENTAIL BACKEND VALIDATION MESSAGE PROMPTS REGARDING A FAILED OR SUCCESSFUL CREATE 
            ingredient = Ingredient.create({name: name, description: description, price: price, image_url: image_url})
             #PRIVATE METHOD FILTERS PARAM COLLECTION OF SELECTED CATEGORIES
             #COLLECTION OF NAMES ARE MATCHED WITH CATEGORY OBJECTS AND ADDED TO COLLECTION
            addCategories(ingredient,addCat,categories)
            if ingredient.save             
                 render json:{ingredient: ingredient }, status: :created
             else
                 render json: {errors: ingredient.errors.full_messages}, status: 
                 :unresponsive_entity
         end
    end
    



    def update
         #ASSIGNING ALL CATEGORIES TO VARIABLE
        categories = Category.all
        #LOCATING INGREDIENT BY PARAMS ID
        ingredient = Ingredient.find_by_id(params[:id])
         #VARIABLE CAPTURING REMOVE CATEGORIES PARAMS
        removeCat = params[:removeCat] != "" ? params[:removeCat] : []
        #VARIABLE CAPTURING ADD CATEGORIES PARAMS
        addCat =  params[:addCat] != "" ? params[:addCat] : []
        #VARIABLE CAPTURING NAME PARAMS
        name = params[:name] != "" ? ingredient.name = params[:name] : ingredient.name
       #VARIABLE CAPTURING DESCRIPTION PARAMS
        description = params[:description] != "" ? ingredient.description = params[:description] : ingredient.description
        #VARIABLE CAPTURING PRICE PARAMS
        price = params[:price] != "" ? ingredient.price = params[:price] : ingredient.price
        #VARIABLE CAPTURING IMAGE_URL PARAMS
        imageUrl = params[:imageUrl] != "" ? ingredient.image_url = params[:imageUrl] : ingredient.image_url
        #CALL UPDATE METHOD ON INGREDIENT WITH RECIEVED PARAMS 
        #EXTENDED FUNCTIONALITY WILL ENTAIL BACKEND VALIDATION MESSAGE PROMPTS REGARDING A FAILED OR SUCCESSFUL UPDATE 
        ingredient.update({name: name, description: description, price: price, image_url: imageUrl})
        #PRIVATE METHOD FILTERS PARAM COLLECTION OF INGREDIENT-CATEGORY OBJECTS BY NAME AND REMOVE FROM COLLECTION
        removeCategories(ingredient,removeCat,categories)
        #PRIVATE METHOD FILTERS PARAM COLLECTION OF SELECTED CATEGORIES
        #COLLECTION OF NAMES ARE MATCHED WITH CATEGORY OBJECTS AND ADDED TO COLLECTION  
        addCategories(ingredient,addCat,categories)
        render json: ingredient
    end
    
    def destroy
        #CONTROLLER ACTION TO DELETE AN INGREDIENT 
        #LOCATES INGREDIENT BY PARAMS ID
        ingredient = Ingredient.find_by_id(params[:id])
        ingredient.delete
       end


    private
        # INTEND TO REFACTOR BELOW METHODS INTO A SINGLE METHOD WITHIN APPLICATION CONTROLLER


    def removeCategories(ingredient,removeCat,categories) 
           #PRIVATE METHOD TO LOOP THROUGH CATEGORY PARAMS 
          #AND INGREDIENT-CATEGORIES TO RETURN MATCHING OBTECTS FOR REMOVAL  
        ingredient.categories.select{|ic|  
        removeCat.each{|rc| 
         if  ic.name == rc
         ingredient.categories.delete(ic)  
        end   
                 }
                }
    end



    def addCategories(ingredient,addCat,categories)
        #PRIVATE METHOD TO LOOP THROUGH ADD CATEGORY PARAMS 
         #AND ALL BACK END CATEGORIES TO RETURN MATCHING OBTECTS FOR ADDITION TO COLLECTION 
        categories.all.each{|c| 
        addCat.each{|ac| 
        if c.name == ac
            ingredient.categories << c
             end
            }
                }
         end

    #WILL USED SANITZED PARAMS FOR EXTENDED FUNCTIONALITY CURRENTLY NOT BEING USED
        def ingredient_params 
        params.require(:ingredient).permit(:id, :name, :description, :image_url, :url, :price, :category_ids, :project_ids)
        end
    end
