class Objective < ActiveRecord::Base
  belongs_to :quest
  has_many :objective_isntances
  attr_accessible :title, :description, :exp
end
