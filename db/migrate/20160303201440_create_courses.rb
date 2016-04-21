class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :user, index:true
      t.string :cnum
      t.string :title
      t.string :term
      t.datetime :start_date
      
      t.timestamps
    end
    
    create_table :cthreads do |t|
      t.belongs_to :course, index:true
      t.string :title
      t.datetime :posted_on
      t.timestamps
    end 

    create_table :questions do |t|
      t.belongs_to :cthread, index:true
      t.belongs_to :user
      t.string :heading
      t.string :statement
      # t.string :posted_by

      t.timestamps
    end

    create_table :responses do |t|
      t.belongs_to :question, index:true
      t.belongs_to :user
      t.string :answer
      t.string :posted_by

      t.timestamps
    end
  end
end
