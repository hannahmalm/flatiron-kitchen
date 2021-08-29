class RecipeIngredient < ActiveRecord::Base
    belongs_to :recipe 
    belongs_to :ingredient
    #join table models should belong to the tables they are joined on 
end 