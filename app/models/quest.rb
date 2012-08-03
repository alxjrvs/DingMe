class Quest < ActiveRecord::Base

  belongs_to :user
  has_many :quest_instances
  has_many :objectives
  attr_accessible :title, :description, :published, :user, :remaining_exp

  validates :title, :description, :presence => true
  validates_associated :objectives

  def self.all_published
    published =  []
    self.all.each do |q|
      published << q if q.published
    end
    published
  end

  def remaining_exp
    exp = 100
    self.objectives.each do |o|
      exp - o.exp
    end
    self.update_attribute(:remaining_exp, exp)
  end
  def add_to_user(user)
    self.quest_instances.create(:user => user)
  end

  def valid_publish
    self.published? and self.objectives.size >=  4 and self.remaning_exp == 0
  end
end
