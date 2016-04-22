class Course < ActiveRecord::Base
    has_many :cthreads, :dependent => :destroy
    belongs_to :user
    has_many :enrolments, :dependent => :destroy
end
