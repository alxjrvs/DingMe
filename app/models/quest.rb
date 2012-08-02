class Quest < ActiveRecord::Base

  before_update :valid_publish
  belongs_to :user
  has_many :quest_instances
  has_many :objectives
  attr_accessible :title, :description, :published, :user

  validates :title, :description, :presence => true
  validates_associated :objectives

  def add_to_user(user)
    self.quest_instances.create(:user => user)
  end

  def valid_publish
    self.published? and self.objectives.size >=  4
  end
end
