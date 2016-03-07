class Course < ActiveRecord::Base
    has_many :cthreads, :dependent => :destroy

    # accepts_nested_attributes_for :cthreads
    # accepts_nested_attributes_for :questions
end
