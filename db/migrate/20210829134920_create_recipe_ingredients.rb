class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id 
      t.integer :ingredient_id
      t.timestamps null: false
    end
    
    #indexs are used to quickly locate data - similar to a table of context
    #add indexes on join tables 
    #use this since we are querying it frequently
    add_index :recipe_ingredients, :recipe_id
    add_index :recipe_ingredients, :ingredient_id
  end
end
