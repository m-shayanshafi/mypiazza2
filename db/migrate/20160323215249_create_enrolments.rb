class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      # t.string :course_name
      # t.integer :user_id
      t.belongs_to :course , index: true
      t.belongs_to :user, index: true
      

      t.timestamps null: false
    end
  end
end
