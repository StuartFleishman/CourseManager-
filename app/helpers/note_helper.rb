module NoteHelper 

  def display_header(course) 
    if course
       tag.h1("#{course.name}") 
    else 
        tag.h2("all the notes") 
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
    else 
      link_to("create note", new_note_path)
    end
  end

  def display_link_to_edit_course(course)
    if course 
      link_to("Edit Course", edit_course_path(course.id))
    end
  end

  def display_link_to_delete_course(course)
    if course 
      link_to 'Delete Course', course_path(@course.id),
               :confirm => 'Are you sure?',
               :method => :delete 
    end
  end


end