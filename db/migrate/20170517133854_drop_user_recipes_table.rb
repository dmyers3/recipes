class DropUserRecipesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_recipes
  end
end
