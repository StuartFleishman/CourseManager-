class CoursesController < ApplicationController 

  def index 
    @courses = Course.all 
  end 

  def show 
  end 

  def new 
    @course = Course.new 
  end 

  def create 
    course = Course.new(course_params)
      if course.save 
        redirect_to courses_path 
      else 
        render :new
      end 
  end 

  def edit 
  end 
  
  def update 
  end 

  def destroy 
  end 

  private 

  def course_params 
    params.require(:course).permit(:name,:subject,:teacher)
  end
end 