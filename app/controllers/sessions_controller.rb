class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome, you've logged in."
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = "Incorrect Username and/or Password"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You've logged out."
    redirect_to root_path
  end
end