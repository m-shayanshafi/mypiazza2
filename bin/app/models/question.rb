class Question < ActiveRecord::Base
    belongs_to :cthread
    belongs_to :user
    has_many :responses, :dependent => :destroy
end
 