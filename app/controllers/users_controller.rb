class UsersController < ApplicationController 

  def welcome 
  end 

  def new 
    @user = User.new
  end 

  def create 
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end 

  
end 