class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string 'cnum'
      t.string 'title'
      t.string 'term'
      t.datetime 'start_date'
      
      t.timestamps
    end
    
    create_table :cthreads do |t|
      t.belongs_to :course, index:true
      t.string 'title'
      t.datetime 'posted_on'
      t.timestamps
    end
  end
end
