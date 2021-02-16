class CoursesController < ApplicationController 
   before_action :find_course, :redirect_if_not_owner, only: [:show, :edit, :update, :destroy]

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
        redirect_to courses_path
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
    params.require(:course).permit(:name,:subject,:teacher, notes_ids:[], notes_attributes:[:content])
  end

  def redirect_if_not_owner
    if current_user != @course.users
      redirect_to root_path, alert: "Not your course"
    end
  end


end 