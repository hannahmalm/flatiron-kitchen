class IngredientsController < ApplicationController 
    before_action :set_ingredient, only: [:edit, :update]

    def index 
    #this is the index page that displays all ingredients
    @ingredients = Ingredient.all
    end 

    def new 
    #this is the new form 
    @ingredient = Ingredient.new 
    end 


    def create 
        #check to see that it is created with the validators stated in model
        ingredient = Ingredient.new(ingredient_params)

        #if the validators are correct, save the instance and redirect it, else render the new form again 
        if ingredient.save 
            redirect_to ingredients_path 
        else 
            render :new 
        end 
    end 

    def edit 
    # @ingredient = Ingredient.find(params[:id])
    end 

    def update 
        #this is exactly the same as create, just swith the render form and the .create to .update
        #variables should also be instance varialbes to use in the forms
        @ingredient = Ingredient.update(ingredient_params)

        #if the validators are correct, save the instance and redirect it, else render the new form again 
        if @ingredient.save 
            redirect_to ingredients_path 
        else 
            render :edit
        end 

    end 

    private 

    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end 

    def ingredient_params 
        #the only thing you can change on the ingredient is the name
        params.require(:ingredient).permit(:name)
    end 
end  