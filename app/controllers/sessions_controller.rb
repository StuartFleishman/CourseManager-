class SessionsController < ApplicationController 
  def new
    @user = User.new 
  end

  def create
    session[:username] = params[:username]
    redirect_to '/'
  end

  def omniauth
  end
end 