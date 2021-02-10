class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :content 
      t.date :date 
      t.integer :user_id 
      t.integer :course_id
      t.timestamps
    end
  end
end
