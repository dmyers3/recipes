class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  def new
    @user = User.new
    
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "You have successfully registered."
      session[:user_id] = @user.id
      redirect_to :root
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      flash["success"] = "You have updated your profile."
      redirect_to :root
    else
      render 'edit'
    end
  end
  
  def destroy
  end
  
  private
    def user_params
      params.require(:user).permit(:email, :zip, :password)
    end
    
    def set_user
      @user = User.find_by(slug: params[:id])
    end
end