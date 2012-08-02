class Quest < ActiveRecord::Base
  belongs_to :user
  has_many :quest_instances
  has_many :objectives
  attr_accessible :title, :description

  validates :title, :description, :presence => true
  validates_associated :objectives

  def add_to_user(user)
    self.quest_instances.create(:user => user)
  end
end
