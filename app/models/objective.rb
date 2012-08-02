class Objective < ActiveRecord::Base
  belongs_to :quest
  has_many :objective_isntances
end
