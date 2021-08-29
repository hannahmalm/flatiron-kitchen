class RecipesController < ApplicationController 
    #before editing or updating a recipe, you must set it
    before_action :set_recipe, only: [:edit, :update]
    #before creating a new recipie or updating a recipe, you must get ingredients
    before_action :get_ingredients, only: [:new, :update]

    def index 
    #this is the index page that displays all ingredients
    @recipes = Recipe.all
    end 

    def new 
    #this is the new form 
    @recipe = Recipe.new 
    end 


    def create 
        #check to see that it is created with the validators stated in model
        recipe = Recipe.new(recipe_params)

        #if the validators are correct, save the instance and redirect it, else render the new form again 
        if recipe.save 
            redirect_to recipes_path 
        else 
            render :new 
        end 
    end 

    def edit 
        @recipe = Recipe.find(params[:id])
    end 

    def update 
        #this is exactly the same as create, just swith the render form and the .create to .update
        @recipe = Recipe.update(recipe_params)

        #if the validators are correct, save the instance and redirect it, else render the new form again 
        if @recipe.save 
            redirect_to recipes_path 
        else 
            render :edit
        end 

    end 

    private 

    #these are the actions used at the top of the controller
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end 

    def get_ingredients
        @ingredients = Ingredient.all
    end 

    def recipe_params 
        #the only thing you can change on the ingredient is the name
        params.require(:recipe).permit(:name, ingredient_ids:[])
    end 
end 