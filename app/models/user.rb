class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy 
  has_many :favorites, dependent: :destroy
  has_many :topics
  
    mount_uploader :avatar, AvatarUploader

  def favorited(post)
    favorites.where(post_id: post.id).first
  end

  def admin?
  	self.role == 'admin'
  end

  def platinum?
  	self.role == 'platinum'
  end

  def bronze?
  	self.role == 'bronze'
  end

  def silver?
  	self.role == 'silver'
  end

  def gold?
  	self.role == 'gold'
  end
  
  
end
