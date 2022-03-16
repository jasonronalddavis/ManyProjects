class Api::V1::ApplicationController < ApplicationController

  #INTEND TO REFACTOR PROJECT AND INGREDINT MODEL CONTROLLER PRPRIVATE METHODS
  #INTO SINGULAR METHODS WITHIN APPLICATION CONTROLLER 
    def welcome      
      projects = Category.all
         render json: projects
      end
    end
