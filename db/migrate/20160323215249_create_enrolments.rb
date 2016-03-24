class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.string :course_name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
