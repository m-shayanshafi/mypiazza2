class CreateCourses < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable

      t.string :name
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :user_type, null:false,default: "student"
      
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
      
      # t.integer :user_type

      # # Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
  
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

    create_table :questions do |t|
      t.belongs_to :cthread, index:true
      t.string :heading
      t.string :statement
      t.references :user, index: true, foreign_key: true
      # t.string :posted_by

      t.timestamps
    end

    create_table :responses do |t|
      t.belongs_to :question, index:true
      t.string :answer
      t.string :posted_by
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
