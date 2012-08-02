class User < ActiveRecord::Base
  has_many :quests
  has_many :quest_instances
  has_many :objective_instances

  # Devise
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  #above is Devise, below is me. 
  attr_accessible :fname, :lname, :admin
  
  validates :fname, :lname, :presence => true

end
