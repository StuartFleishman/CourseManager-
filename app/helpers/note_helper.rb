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


end