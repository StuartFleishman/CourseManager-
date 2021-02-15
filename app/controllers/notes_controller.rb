class NotesController < ApplicationController 
  before_action :find_note, :redirect_if_not_owner,  only: [:show, :edit, :update, :destroy]

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
    #@note = current_user.notes.build(note_params)
    @note = Note.new(note_params)
    @note.user_id = session[:user_id]
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
    params.require(:note).permit(:content, course_ids:[], course_attributes:[:name, :subject, :teacher])
  end 

  def redirect_if_not_owner
    if current_user != @note.user
      redirect_to notes_path, alert: "Not your note"
    end
  end

  def find_note
    @note = Note.find(params[:id])
  end


end 