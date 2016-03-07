class Question < ActiveRecord::Base
    belongs_to :cthread
    has_many :responses, :dependent => :destroy
end
 