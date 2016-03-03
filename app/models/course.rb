class Course < ActiveRecord::Base
    has_many :cthreads
    accepts_nested_attributes_for :cthreads
end
