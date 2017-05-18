class RecipesController < ApplicationController
  before_action :redirect_logged_out, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  
  def index
    @recipes = Recipe.where(user_id: [current_user.id, ADMIN_IDS].flatten)
  end
  
  def show
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.creator = current_user
    
    if @recipe.save
      flash[:success] = "Recipe successfully created."
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name, :prep_time, :cook_time, :url, :instructions)
    end
    
    def set_recipe
      @recipe = Recipe.find_by(slug: params[:id])
    end
end