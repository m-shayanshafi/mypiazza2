class Course < ActiveRecord::Base
    has_many :cthreads
    has_many :questions

    # accepts_nested_attributes_for :cthreads
    # accepts_nested_attributes_for :questions
end
