class Quest < ActiveRecord::Base

  belongs_to :user
  has_many :quest_instances
  has_many :objectives
  attr_accessible :title, :description, :published, :user, :remaining_exp 

  validates :title, :description, :presence => true
  validates_associated :objectives

    def remaining_exp
      start = 100 
        self.objectives.each do |o|
          start -= o.exp  
        end
      start
    end

  def self.all_published
    published =  []
    self.all.each do |q|
      published << q if q.published
    end
    published
  end

  def add_to_user(user)
    self.quest_instances.create(:user => user)
  end

  def valid_publish
    self.published? and self.objectives.size >=  4  and self.remaning_exp == 0
  end
end
