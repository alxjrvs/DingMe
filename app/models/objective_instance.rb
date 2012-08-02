class ObjectiveInstance < ActiveRecord::Base
  belongs_to :quest_instance
  belongs_to :objective
end
