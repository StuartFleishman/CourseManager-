class NotesController < ApplicationController 
  before_action :redirect_if_not_owner

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
    @note = Note.find(params[:id])
  end 
  
  def update 
  end 

  def destroy 
  end 

  private 

  def note_params 
    params.require(:note).permit(:content, course_ids:[], course_attributes:[:name, :subject, :teacher])
  end 

  def redirect_if_not_owner
    if current_user != @shoe.user
      redirect_to notes_path, alert: "Not your note"
    end
  end

  def find_note
    @note = Note.find(params[:id])
  end


end 