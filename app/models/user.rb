class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :friendships  
  has_many :friends, :through => :friendships  

  def posts_posted
  	Post.where(:by => self.id)
  end

  def posts_received
  	Post.where(:to => self.id)
  end
  
end
