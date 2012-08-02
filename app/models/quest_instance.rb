class QuestInstance < ActiveRecord::Base
  belongs_to :quest
  belongs_to :user
  has_many :objective_instances

  attr_accessible :user
end
