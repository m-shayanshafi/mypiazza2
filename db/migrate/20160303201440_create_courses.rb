class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string 'cnum'
      t.string 'title'
      t.string 'term'
      t.datetime 'start_date'
      
      t.timestamps
    end
  end
end
