class SessionsController < ApplicationController 
  def new
    @user = User.new 
  end

  def create
    session[:username] = params[:username]
    redirect_to '/'
  end

  def omniauth
    @user = User.create_from_omniauth(auth)

    if @user.valid?
      session[:user_id] = @user.id 
      redirect_to new_course_path
    else
      flash[:message] = user.errors.full_messages.join("")
      redirect_to courses_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private 

    def auth 
      request.env['omniauth.auth']
    end
end 