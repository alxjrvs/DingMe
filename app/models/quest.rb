class Quest < ActiveRecord::Base
  belongs_to :user
  has_many :quest_instances
  attr_accessible :title, :description


  def add_to_user(user)
    self.quest_instances.create(:user => user)
  end
end
