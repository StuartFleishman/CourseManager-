class CoursesController < ApplicationController 
   before_action :find_course, only: [:show, :edit, :update, :destroy]
   

  def index 
    @courses = Course.all
  end 

  def show 
  end 

  def new 
    @course = Course.new 
    @course.notes.build
  end 

  def create 
    @course = current_user.courses.build(course_params)
      if @course.save 
        redirect_to @course
      else 
        render :new
      end 
  end 

  def edit 
  end 
  
  def update 
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end 

  def destroy 
    @course.destroy
    redirect_to courses_path
  end 

  private 

  def find_course 
    @course = Course.find(params[:id])
  end 

  def course_params 
    params.require(:course).permit(:name,:subject,:teacher, notes_attributes:[:content])
  end






end 