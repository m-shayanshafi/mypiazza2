class Question < ActiveRecord::Base
    belongs_to :course
    belongs_to :cthread
end
