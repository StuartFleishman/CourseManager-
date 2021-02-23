module NoteHelper 

  def display_header(course) 
    if course
       tag.h1("#{course.name}") 
    else 
        tag.h2("notes") 
      end 
  end


  def display_course_fields(course, f)
    if course
      f.hidden_field :course_id 
    else
      render partial: 'course_select', locals: {f: f} 
    end 
  end 

  def display_link_to_new_note(course)
    if course 
      link_to("Make A New Note", new_course_note_path(course.id))
    end
  end


end