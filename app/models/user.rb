class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy 
  
    mount_uploader :avatar, AvatarUploader

  def admin?
  	role == 'admin'
  end

  def platinum?
  	role == 'platinum'
  end

  def bronze?
  	role == 'bronze'
  end

  def silver?
  	role == 'silver'
  end

  def gold?
  	role == 'gold'
  end
  
  
end
