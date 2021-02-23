class NotesController < ApplicationController 
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_owner, only: [:edit, :update, :destroy]

  def index 
    if params[:course_id] && @course = Course.find_by_id(params[:course_id])
      @notes = @course.notes 
    else
      @notes = Note.all 
    end
  end 

  def show 
  end 

  def new 
    if params[:course_id] && @course = Course.find_by_id(params[:course_id])
      @note = @course.notes.build
    else
      @note = Note.new 
      @note.build_course
    end
  end 

  def create 
    @note = current_user.notes.build(note_params)
    if @note.save 
      redirect_to note_path(@note)
    else 
      render :new 
    end
  end 

  def edit 
  end 
  
  def update 
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit
    end
  end 

  def destroy 
    @note.destroy
    redirect_to courses_path
  end 

  private 

  def note_params 
    params.require(:note).permit(:content, :topic, :course_id, course_attributes:[:name, :subject, :teacher])
  end 

  def redirect_if_not_owner
    if current_user != @note.user
      flash[:message] =  "Not your note"
      redirect_to notes_path
    end
  end

  def find_note
    @note = Note.find(params[:id])
  end


end 