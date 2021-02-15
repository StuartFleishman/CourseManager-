module NoteHelper 

  def display_header(course) 
    if course
       tag.h1("#{course.name}") 
    else 
        tag.h2("all the notes") 
      end 
  end

end