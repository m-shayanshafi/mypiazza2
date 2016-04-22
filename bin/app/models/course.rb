class Course < ActiveRecord::Base
    has_many :cthreads, :dependent => :destroy
    belongs_to :user
end
