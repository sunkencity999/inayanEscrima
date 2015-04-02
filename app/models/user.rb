class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def admin?
  	role == 'admin'
  end

  def instructor?
  	role == 'instructor'
  end

  def basic?
  	role == 'basic'
  end

  def silver?
  	role == 'silver'
  end

  def gold?
  	role == 'gold'
  end
  
  
end
