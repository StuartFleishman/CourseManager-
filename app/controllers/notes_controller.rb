class NotesController < ApplicationController 

  def index 
    @notes = Note.all 
  end 

  def show 
    @note = Note.find(params[:id])
  end 

  def new 
    @note = Note.new 
    @note.build_course
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
  end 

  def destroy 
  end 

  private 

  def note_params 
    params.require(:note).permit(:content, course_ids:[], course_attributes:[:name, :subject, :teacher])
  end 


end 