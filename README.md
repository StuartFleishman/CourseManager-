# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

   <%= f.collection_check_boxes :note_ids, Note.all, :id, :content %>
  <%= f.label 'Course Teacher' %>
  <%= f.text_field :teacher%>
  
  <%= f.fields_for :notes do |c| %>
  <%= c.label 'content' %>
  <%= c.text_area :content%>
  <br>
<%end%>