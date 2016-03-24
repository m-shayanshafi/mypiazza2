class Course < ActiveRecord::Base
    has_many :cthreads, :dependent => :destroy
end
