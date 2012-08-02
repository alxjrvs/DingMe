class ObjectiveInstance < ActiveRecord::Base
  belongs_to :quest_instance
  attr_accessible :completed
end
