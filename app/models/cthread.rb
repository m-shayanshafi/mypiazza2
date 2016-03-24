class Cthread < ActiveRecord::Base
    belongs_to :course
    has_many :questions, :dependent => :destroy
end
